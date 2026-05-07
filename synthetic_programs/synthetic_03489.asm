; input driven program
; initialization
  LDI r18, 347
  LDI r11, 0xD11609
  LDI r9, 4
  LDI r13, 3640
  LDI r2, 3801
  LDI r1, 4
main_0:
  LDI r5, 1836
  LDI r1, 64
  LDI r6, 1391
  TEXT r5, r1, r6, "HELLO"
  LDI r4, 4
  LDI r4, 0xBA8222
  LDI r31, 372
  DRAWTEXT r4, r4, r31, "WORLD"
  LDI r10, 2934
  LDI r7, 0xC3873C
  LDI r1, 8
  LDI r15, 1340
  LDI r0, 0xDB79FE
  LINE r10, r7, r1, r15, r0
  CMP r9, r0
  DIV r14, r3, r5
  IKEY r5
  CMPI r5, 64
  JNZ r5, key_1
  FRAME
  JMP main_0
