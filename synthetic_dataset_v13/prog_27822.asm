; DESCRIPTION: Sets a single black pixel at (241, 34).
; PLAN: r0=241(x), r1=34(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 241
LDI r1, 34
LDI r2, 0x000000
PSET r0, r1, r2
HALT
