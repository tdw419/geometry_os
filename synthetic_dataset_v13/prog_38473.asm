; DESCRIPTION: Sets a single yellow pixel at (52, 158).
; PLAN: r0=52(x), r1=158(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 52
LDI r1, 158
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
