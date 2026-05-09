; DESCRIPTION: Sets a single black pixel at (233, 23).
; PLAN: r0=233(x), r1=23(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 233
LDI r1, 23
LDI r2, 0x000000
PSET r0, r1, r2
HALT
