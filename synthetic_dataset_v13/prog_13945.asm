; DESCRIPTION: Sets a single yellow pixel at (466, 90).
; PLAN: r0=466(x), r1=90(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 466
LDI r1, 90
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
