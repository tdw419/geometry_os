; DESCRIPTION: Sets a single yellow pixel at (423, 196).
; PLAN: r0=423(x), r1=196(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 423
LDI r1, 196
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
