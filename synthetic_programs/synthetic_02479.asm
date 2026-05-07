; input driven program
; initialization
  LDI r10, 18
  LDI r8, 62
  LDI r0, 0xF71198
main_0:
  IKEY r14
  CMPI r14, 32
  JNZ r14, key_1
  LDI r15, 4
  LDI r12, 0x6EAFCC
  LDI r2, 0xA4CA37
  PSETI
  LDI r11, 128
  LDI r9, 32
  LDI r6, 32
  DRAWTEXT r11, r9, r6, "WORLD"
  CMP r14, r15
  LDI r31, 16
  LDI r3, 0x55458B
  LDI r14, 2148
  TEXT r31, r3, r14, "HELLO"
  FRAME
  JMP main_0
