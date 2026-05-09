; DESCRIPTION: Sets a single black pixel at (53, 84).
; PLAN: r0=53(x), r1=84(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 53
LDI r1, 84
LDI r2, 0x000000
PSET r0, r1, r2
HALT
