; DESCRIPTION: Sets a single yellow pixel at (3, 240).
; PLAN: r0=3(x), r1=240(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 240
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
