; DESCRIPTION: Sets a single yellow pixel at (450, 77).
; PLAN: r0=450(x), r1=77(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 450
LDI r1, 77
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
