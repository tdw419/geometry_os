; DESCRIPTION: Sets a single yellow pixel at (241, 12).
; PLAN: r0=241(x), r1=12(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 241
LDI r1, 12
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
