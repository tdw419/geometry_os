; input driven program
; initialization
  LDI r0, 2002
  LDI r7, 0x345355
  LDI r14, 16
  LDI r8, 2281
  LDI r26, 4054
main_0:
  IKEY r9
  CMPI r9, 0x2BB138
  JNZ r9, key_1
  ANDI r10, r0, 0x2EE8D9
  LDI r7, 196
  LDI r2, 32
  LDI r4, 101
  TEXT r7, r2, r4, "HELLO"
  FRAME
  JMP main_0
