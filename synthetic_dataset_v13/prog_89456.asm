; DESCRIPTION: Sets a single yellow pixel at (176, 114).
; PLAN: r0=176(x), r1=114(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 176
LDI r1, 114
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
