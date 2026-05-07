; simple draw program
; initialization
  LDI r12, 4
  LDI r14, 8
  LDI r2, 2370
  LDI r1, 10
  LDI r10, 0x74EC43
  LDI r14, 0x00F2BB
  LDI r9, 8
  LDI r9, 0xE9B4C1
  PSET r14, r9, r9
  LDI r14, 0xB7F94B
  LDI r14, 0x7C6280
  LDI r1, 547
  WPIXEL
  LDI r14, 1
  LDI r4, 0xE1A660
  LDI r13, 0xC33AE4
  LDI r15, 16
  LDI r0, 128
  LINE r14, r4, r13, r15, r0
  HALT
