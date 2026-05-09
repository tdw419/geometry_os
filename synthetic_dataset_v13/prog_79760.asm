; DESCRIPTION: Sets a single yellow pixel at (380, 2).
; PLAN: r0=380(x), r1=2(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 380
LDI r1, 2
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
