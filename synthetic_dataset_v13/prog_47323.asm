; DESCRIPTION: Sets a single yellow pixel at (79, 178).
; PLAN: r0=79(x), r1=178(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 79
LDI r1, 178
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
