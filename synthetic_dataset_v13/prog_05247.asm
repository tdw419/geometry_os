; DESCRIPTION: Sets a single yellow pixel at (304, 37).
; PLAN: r0=304(x), r1=37(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 304
LDI r1, 37
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
