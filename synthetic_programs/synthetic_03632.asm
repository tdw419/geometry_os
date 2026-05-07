; simple draw program
; initialization
  LDI r15, 1
  LDI r1, 4
  LDI r4, 1736
  LDI r3, 3892
  LDI r12, 0x18D1B8
  LDI r8, 0x4CC1D9
  PSET r3, r12, r8
  LDI r12, 3413
  LDI r3, 16
  LDI r5, 1950
  LDI r3, 1
  CIRCLE r12, r3, r5, r3
  HALT
