; drawing loop program
; initialization
  LDI r6, 128
  LDI r4, 8
  LDI r0, 2707
  LDI r5, 1805
  LDI r1, 3352
  LDI r11, 0xDE67A4
main_0:
  CMPI r5, 193
  SUBI r11, r15, 0xE316D5
  LDI r9, 256
  LDI r1, 256
  LDI r8, 0xC3EB94
  DRAWTEXT r9, r1, r8, "WORLD"
  FRAME
  JMP main_0
