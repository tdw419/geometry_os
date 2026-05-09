; DESCRIPTION: Sets a single black pixel at (420, 35).
; PLAN: r0=420(x), r1=35(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 420
LDI r1, 35
LDI r2, 0x000000
PSET r0, r1, r2
HALT
