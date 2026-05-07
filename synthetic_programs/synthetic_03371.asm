; input driven program
; initialization
  LDI r11, 0xDB2664
  LDI r13, 2281
  LDI r2, 1359
main_0:
  SHLI r10, r3, 10
  SHLI r5, r15, 2
  SHL r1, r3, r10
  SHLI r15, r8, 32
  DIV r2, r9, r14
  CMP r14, r7
  IKEY r14
  CMPI r14, 0x8F4743
  JNZ r14, key_1
  LDI r3, 0xECDE4C
  LDI r9, 256
  LDI r15, 0xE3A637
  TEXT r3, r9, r15, "HELLO"
  LDI r4, 10
  LDI r14, 1727
  LDI r3, 0xBC331A
  PSETI
  FRAME
  JMP main_0
