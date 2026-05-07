; input driven program
; initialization
  LDI r13, 4
  LDI r12, 0xDC5D37
  LDI r1, 0x61C9FE
  LDI r0, 1
  LDI r14, 0x7A3953
  LDI r9, 0x9EB9D2
main_0:
  IKEY r9
  CMPI r9, 32
  JNZ r9, key_1
  IKEY r6
  CMPI r6, 0xC434A7
  JNZ r6, key_2
  FRAME
  JMP main_0
