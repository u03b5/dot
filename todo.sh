TODO_FILE=.todo.md
TODO_DIRECTORY=$HOME
TODO_FILE_PATH=$TODO_DIRECTORY/$TODO_FILE
todo_help() {
  echo "[edit] [list] [restore] [backup]"
}
todo() {
  if [ $# -ne 1 ]; then
    todo_help
  else
    case $1 in
      edit)
        $EDITOR $TODO_FILE_PATH
        ;;
      list)
        glow -s dark $TODO_FILE_PATH
        ;;
      restore)
        if [ -f $TODO_FILE_PATH.bak ]; then
          rm -f $TODO_FILE_PATH
          cp $TODO_FILE_PATH.bak $TODO_FILE_PATH
        fi
        ;;
      backup)
        cp -f $TODO_FILE_PATH $TODO_FILE_PATH.bak
        ;;
      *)
        echo -n "Invalid option "
        todo_help
        ;;
    esac
  fi
}
