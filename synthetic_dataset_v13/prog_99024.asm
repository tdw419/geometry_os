; DESCRIPTION: Sets a single yellow pixel at (456, 233).
; PLAN: r0=456(x), r1=233(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 456
LDI r1, 233
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
