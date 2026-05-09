; DESCRIPTION: Sets a single yellow pixel at (483, 79).
; PLAN: r0=483(x), r1=79(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 483
LDI r1, 79
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
