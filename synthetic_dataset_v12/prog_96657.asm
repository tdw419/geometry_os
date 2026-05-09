; DESCRIPTION: Sets a single yellow pixel at (459, 247).
; PLAN: r0=459(x), r1=247(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 459
LDI r1, 247
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
