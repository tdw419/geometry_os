; DESCRIPTION: Sets a single black pixel at (10, 53).
; PLAN: r0=10(x), r1=53(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 10
LDI r1, 53
LDI r2, 0x000000
PSET r0, r1, r2
HALT
