; DESCRIPTION: Sets a single yellow pixel at (79, 70).
; PLAN: r0=79(x), r1=70(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 79
LDI r1, 70
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
