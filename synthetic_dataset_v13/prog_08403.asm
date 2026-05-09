; DESCRIPTION: Sets a single yellow pixel at (49, 187).
; PLAN: r0=49(x), r1=187(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 49
LDI r1, 187
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
