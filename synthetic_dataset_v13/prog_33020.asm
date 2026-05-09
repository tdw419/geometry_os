; DESCRIPTION: Sets a single green pixel at (339, 97).
; PLAN: r0=339(x), r1=97(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 339
LDI r1, 97
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
