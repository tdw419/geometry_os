; input driven program
; initialization
  LDI r9, 0x39CFA1
  LDI r12, 3980
  LDI r10, 8
  LDI r6, 3093
  LDI r7, 3550
main_0:
  IKEY r8
  CMPI r8, 1
  JNZ r8, key_1
  LDI r7, 3294
  FILL r7
  LDI r1, 0xA7A0D0
  LDI r4, 0x552AA0
  LDI r15, 1374
  TEXT r1, r4, r15, "HELLO"
  LDI r2, 0
  LDI r9, 8
  LDI r8, 8
  LDI r8, 186
  CIRCLE r2, r9, r8, r8
  FRAME
  JMP main_0
