; DESCRIPTION: Sets a single yellow pixel at (373, 133).
; PLAN: r0=373(x), r1=133(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 373
LDI r1, 133
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
