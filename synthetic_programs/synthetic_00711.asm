; input driven program
; initialization
  LDI r7, 2
  LDI r9, 64
main_0:
  IKEY r12
  CMPI r12, 4
  JNZ r12, key_1
  CMPI r14, r13, 197
  LDI r14, 1517
  LDI r4, 0x5EF5ED
  LDI r13, 2
  TEXT r14, r4, r13, "HELLO"
  FRAME
  JMP main_0
