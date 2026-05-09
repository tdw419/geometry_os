; DESCRIPTION: Sets a single yellow pixel at (216, 194).
; PLAN: r0=216(x), r1=194(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 216
LDI r1, 194
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
