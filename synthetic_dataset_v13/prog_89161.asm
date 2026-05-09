; DESCRIPTION: Sets a single black pixel at (35, 131).
; PLAN: r0=35(x), r1=131(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 35
LDI r1, 131
LDI r2, 0x000000
PSET r0, r1, r2
HALT
