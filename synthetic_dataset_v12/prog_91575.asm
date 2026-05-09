; DESCRIPTION: Sets a single yellow pixel at (501, 11).
; PLAN: r0=501(x), r1=11(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 501
LDI r1, 11
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
