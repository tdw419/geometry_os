; DESCRIPTION: Sets a single yellow pixel at (279, 61).
; PLAN: r0=279(x), r1=61(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 279
LDI r1, 61
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
