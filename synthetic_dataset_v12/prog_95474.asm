; DESCRIPTION: Sets a single yellow pixel at (448, 200).
; PLAN: r0=448(x), r1=200(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 448
LDI r1, 200
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
