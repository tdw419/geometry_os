; simple draw program
; initialization
  LDI r7, 4048
  LDI r11, 2004
  LDI r1, 2098
  LDI r9, 128
  LDI r3, 8
  LDI r8, 442
  LDI r12, 0x7A4616
  LDI r0, 2
  LDI r7, 153
  LDI r10, 10
  LDI r2, 2
  RECTF r12, r0, r7, r10, r2
  LDI r10, 8
  LDI r6, 3842
  LDI r6, 0xE1F3CC
  PSET r10, r6, r6
  HALT
