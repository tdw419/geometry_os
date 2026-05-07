; drawing loop program
; initialization
  LDI r4, 1153
  LDI r13, 0xDA177F
  LDI r5, 1
main_0:
  CMPI r2, r3, 0x49876A
  LDI r1, 255
  LDI r11, 1660
  LDI r2, 3452
  DRAWTEXT r1, r11, r2, "WORLD"
  ANDI r1, r6, 64
  FRAME
  JMP main_0
