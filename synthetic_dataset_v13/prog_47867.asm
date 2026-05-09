; DESCRIPTION: Sets a single yellow pixel at (90, 52).
; PLAN: r0=90(x), r1=52(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 90
LDI r1, 52
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
