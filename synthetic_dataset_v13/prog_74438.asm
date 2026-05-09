; DESCRIPTION: Sets a single black pixel at (339, 233).
; PLAN: r0=339(x), r1=233(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 339
LDI r1, 233
LDI r2, 0x000000
PSET r0, r1, r2
HALT
