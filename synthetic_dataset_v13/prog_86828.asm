; DESCRIPTION: Sets a single yellow pixel at (6, 131).
; PLAN: r0=6(x), r1=131(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 6
LDI r1, 131
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
