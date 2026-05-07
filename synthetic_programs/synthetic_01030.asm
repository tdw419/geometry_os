; drawing loop program
; initialization
  LDI r11, 1
  LDI r7, 3095
  LDI r9, 2366
  LDI r6, 8
  LDI r2, 64
main_0:
  LDI r9, 255
  LDI r11, 0xC70AB2
  LDI r0, 2704
  LDI r11, 2345
  LDI r15, 2575
  RECTF r9, r11, r0, r11, r15
  AND r9, r7, r3
  XOR r3, r11, r9
  XOR r6, r0, r15
  AND r8, r2, r12
  FRAME
  JMP main_0
