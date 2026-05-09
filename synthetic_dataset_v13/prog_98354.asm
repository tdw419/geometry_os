; DESCRIPTION: Sets a single yellow pixel at (128, 78).
; PLAN: r0=128(x), r1=78(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 128
LDI r1, 78
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
