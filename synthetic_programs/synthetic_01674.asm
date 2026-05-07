; input driven program
; initialization
  LDI r4, 0xB431AA
  LDI r13, 1093
  LDI r6, 64
main_0:
  CMP r10, r15
  MUL r6, r21, r2
  LDI r12, 0xA26A5C
  LDI r2, 0x231DF2
  LDI r8, 0x6A5C16
  DRAWTEXT r12, r2, r8, "WORLD"
  LDI r1, 64
  LDI r11, 0x2CAEFE
  LDI r7, 2055
  TEXT r1, r11, r7, "HELLO"
  FRAME
  JMP main_0
