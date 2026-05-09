; DESCRIPTION: Sets a single yellow pixel at (419, 96).
; PLAN: r0=419(x), r1=96(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 419
LDI r1, 96
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
