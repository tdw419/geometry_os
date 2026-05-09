; DESCRIPTION: Sets a single yellow pixel at (19, 17).
; PLAN: r0=19(x), r1=17(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 19
LDI r1, 17
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
