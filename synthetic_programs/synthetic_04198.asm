; simple draw program
; initialization
  LDI r3, 8
  LDI r14, 0x4E7244
  LDI r1, 0
  LDI r4, 3224
  LDI r6, 32
  LDI r7, 1528
  LDI r2, 3864
  LINE r1, r4, r6, r7, r2
  LDI r1, 1411
  LDI r3, 8
  LDI r10, 64
  LDI r3, 0x349E66
  LDI r3, 0x4EE560
  RECTF r1, r3, r10, r3, r3
  HALT
