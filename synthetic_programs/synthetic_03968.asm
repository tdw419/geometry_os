; drawing loop program
; initialization
  LDI r9, 630
  LDI r1, 2529
  LDI r7, 16
  LDI r5, 1060
  LDI r10, 2744
  LDI r3, 3025
  LDI r2, 211
main_0:
  LDI r8, 0xD3EAEA
  LDI r4, 0xBC2C38
  LDI r11, 32
  DRAWTEXT r8, r4, r11, "WORLD"
  LDI r11, 0x824AF0
  FILL r11
  LDI r2, 2053
  LDI r7, 256
  LDI r12, 128
  TEXT r2, r7, r12, "HELLO"
  OR r1, r2, r11
  AND r9, r13, r5
  AND r15, r14, r10
  FRAME
  JMP main_0
