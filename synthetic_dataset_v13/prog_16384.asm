; DESCRIPTION: Sets a single yellow pixel at (273, 217).
; PLAN: r0=273(x), r1=217(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 273
LDI r1, 217
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
