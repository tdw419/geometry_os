; input driven program
; initialization
  LDI r11, 0x8C7B32
  LDI r9, 1330
  LDI r5, 0xE854CB
main_0:
  DIV r14, r8, r3
  IKEY r19
  CMPI r19, 0xFDF886
  JNZ r19, key_1
  IKEY r10
  CMPI r10, 16
  JNZ r10, key_2
  LDI r8, 1441
  LDI r3, 0xF64334
  LDI r13, 0x846EAB
  LDI r14, 25
  CIRCLE r8, r3, r13, r14
  LDI r4, 8
  LDI r7, 0x8F18BF
  LDI r3, 2147
  TEXT r4, r7, r3, "HELLO"
  FRAME
  JMP main_0
