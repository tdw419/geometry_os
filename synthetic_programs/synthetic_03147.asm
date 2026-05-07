; input driven program
; initialization
  LDI r3, 10
  LDI r5, 0x92FBD3
main_0:
  IKEY r3
  CMPI r3, 0
  JNZ r3, key_1
  CMPI r1, 123
  FRAME
  JMP main_0
