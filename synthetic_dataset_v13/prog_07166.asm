; DESCRIPTION: Sets a single yellow pixel at (204, 101).
; PLAN: r0=204(x), r1=101(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 204
LDI r1, 101
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
