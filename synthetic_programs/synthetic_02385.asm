; simple draw program
; initialization
  LDI r3, 1251
  LDI r12, 2286
  LDI r12, 0x21725D
  LDI r2, 71
  LDI r1, 256
  LDI r13, 256
  LDI r5, 1937
  RECTF r12, r2, r1, r13, r5
  LDI r11, 4054
  LDI r9, 0xDAC2CC
  LDI r8, 2
  WPIXEL
  LDI r1, 16
  LDI r0, 0x9F0557
  LDI r3, 3108
  PSET r1, r0, r3
  HALT
