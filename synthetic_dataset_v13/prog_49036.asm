; DESCRIPTION: Sets a single yellow pixel at (195, 7).
; PLAN: r0=195(x), r1=7(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 195
LDI r1, 7
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
