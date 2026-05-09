; DESCRIPTION: Sets a single yellow pixel at (399, 88).
; PLAN: r0=399(x), r1=88(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 399
LDI r1, 88
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
