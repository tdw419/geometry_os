; DESCRIPTION: Sets a single green pixel at (339, 87).
; PLAN: r0=339(x), r1=87(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 339
LDI r1, 87
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
