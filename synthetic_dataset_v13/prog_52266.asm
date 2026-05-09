; DESCRIPTION: Sets a single yellow pixel at (198, 65).
; PLAN: r0=198(x), r1=65(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 198
LDI r1, 65
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
