; DESCRIPTION: Sets a single yellow pixel at (124, 103).
; PLAN: r0=124(x), r1=103(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 124
LDI r1, 103
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
