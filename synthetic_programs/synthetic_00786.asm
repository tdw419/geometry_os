; simple draw program
; initialization
  LDI r15, 8
  LDI r9, 16
  LDI r7, 1858
  LDI r5, 0xCF78F7
  LDI r1, 2
  LDI r8, 1368
  LDI r3, 0
  LDI r9, 0xC2C4BA
  LDI r1, 0x8A3A6D
  LINE r1, r8, r3, r9, r1
  LDI r4, 3650
  LDI r13, 64
  LDI r5, 0xC09F8E
  LDI r1, 32
  LDI r5, 807
  LINE r4, r13, r5, r1, r5
  LDI r10, 256
  LDI r11, 3012
  LDI r4, 16
  LDI r2, 16
  LDI r8, 8
  RECTF r10, r11, r4, r2, r8
  HALT
