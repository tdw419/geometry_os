; DESCRIPTION: Sets a single yellow pixel at (431, 21).
; PLAN: r0=431(x), r1=21(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 431
LDI r1, 21
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
