; DESCRIPTION: Sets a single yellow pixel at (58, 202).
; PLAN: r0=58(x), r1=202(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 58
LDI r1, 202
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
