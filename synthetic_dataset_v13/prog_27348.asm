; DESCRIPTION: Sets a single black pixel at (12, 233).
; PLAN: r0=12(x), r1=233(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 12
LDI r1, 233
LDI r2, 0x000000
PSET r0, r1, r2
HALT
