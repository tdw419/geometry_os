; drawing loop program
; initialization
  LDI r13, 2984
  LDI r9, 128
  LDI r3, 10
main_0:
  LDI r18, 10
  LDI r14, 0
  LDI r0, 929
  DRAWTEXT r18, r14, r0, "WORLD"
  LDI r4, 2049
  LDI r13, 0x7EA0A0
  LDI r9, 221
  DRAWTEXT r4, r13, r9, "WORLD"
  LDI r1, 514
  LDI r9, 2371
  LDI r3, 2388
  TEXT r1, r9, r3, "HELLO"
  IKEY r13
  CMPI r13, 2
  JNZ r13, key_1
  MUL r2, r0, r1
  FRAME
  JMP main_0
