; DESCRIPTION: Sets a single yellow pixel at (111, 71).
; PLAN: r0=111(x), r1=71(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 71
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
