; DESCRIPTION: Sets a single yellow pixel at (376, 38).
; PLAN: r0=376(x), r1=38(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 376
LDI r1, 38
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
