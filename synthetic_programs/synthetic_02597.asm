; drawing loop program
; initialization
  LDI r9, 3870
  LDI r4, 0xC5B9B7
  LDI r14, 0xDCFB08
  LDI r6, 3326
main_0:
  LDI r8, 194
  LDI r4, 0x5A2B53
  LDI r4, 2665
  DRAWTEXT r8, r4, r4, "WORLD"
  ANDI r12, r4, 0x0B6F57
  FRAME
  JMP main_0
