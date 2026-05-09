; DESCRIPTION: Sets a single yellow pixel at (182, 31).
; PLAN: r0=182(x), r1=31(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 182
LDI r1, 31
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
