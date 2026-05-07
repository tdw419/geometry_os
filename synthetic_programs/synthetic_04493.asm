; input driven program
; initialization
  LDI r8, 1250
  LDI r7, 1647
  LDI r10, 16
main_0:
  IKEY r13
  CMPI r13, 0x85CAFE
  JNZ r13, key_1
  CMPI r11, 186
  FRAME
  JMP main_0
