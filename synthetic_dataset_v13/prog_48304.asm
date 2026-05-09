; DESCRIPTION: Sets a single yellow pixel at (421, 102).
; PLAN: r0=421(x), r1=102(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 421
LDI r1, 102
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
