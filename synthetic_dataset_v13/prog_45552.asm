; DESCRIPTION: Sets a single black pixel at (124, 104).
; PLAN: r0=124(x), r1=104(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 124
LDI r1, 104
LDI r2, 0x000000
PSET r0, r1, r2
HALT
