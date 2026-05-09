; DESCRIPTION: Sets a single yellow pixel at (33, 89).
; PLAN: r0=33(x), r1=89(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 33
LDI r1, 89
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
