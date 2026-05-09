; DESCRIPTION: Sets a single yellow pixel at (80, 251).
; PLAN: r0=80(x), r1=251(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 80
LDI r1, 251
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
