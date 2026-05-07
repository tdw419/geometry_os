; drawing loop program
; initialization
  LDI r11, 1903
  LDI r4, 2836
  LDI r8, 0x7651D3
  LDI r7, 0xFAB73D
  LDI r6, 32
  LDI r9, 0x122237
  LDI r3, 3909
main_0:
  LDI r15, 3565
  LDI r12, 255
  LDI r12, 21
  LDI r5, 3688
  LDI r4, 0x5A13DE
  LINE r15, r12, r12, r5, r4
  LDI r8, 0xE00609
  LDI r11, 170
  LDI r1, 2368
  DRAWTEXT r8, r11, r1, "WORLD"
  SHLI r12, r14, 0x85DC7D
  SAR r1, r9, r6
  SHL r15, r5, r1
  SHL r9, r6, r13
  CMPI r0, 4
  LDI r1, 3259
  LDI r8, 0x76A5E1
  LDI r8, 2
  DRAWTEXT r1, r8, r8, "WORLD"
  SHR r5, r0, r6
  FRAME
  JMP main_0
