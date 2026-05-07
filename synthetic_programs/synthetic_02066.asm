; drawing loop program
; initialization
  LDI r8, 3963
  LDI r1, 4
  LDI r9, 0xDE6562
  LDI r4, 3436
  LDI r13, 0xB1C03F
  LDI r3, 64
  LDI r0, 0x8059BF
main_0:
  LDI r13, 223
  LDI r3, 2628
  LDI r8, 2
  DRAWTEXT r13, r3, r8, "WORLD"
  IKEY r4
  CMPI r4, 251
  JNZ r4, key_1
  IKEY r3
  CMPI r3, 0x8E4093
  JNZ r3, key_2
  LDI r4, 0x51042A
  LDI r13, 0x1E01EC
  LDI r6, 3984
  TEXT r4, r13, r6, "HELLO"
  MUL r7, r1, r11
  DIV r22, r8, r15
  FRAME
  JMP main_0
