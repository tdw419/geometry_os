; DESCRIPTION: Sets a single yellow pixel at (49, 86).
; PLAN: r0=49(x), r1=86(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 49
LDI r1, 86
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
