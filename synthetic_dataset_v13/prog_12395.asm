; DESCRIPTION: Sets a single yellow pixel at (29, 19).
; PLAN: r0=29(x), r1=19(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 29
LDI r1, 19
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
