; DESCRIPTION: Sets a single black pixel at (212, 67).
; PLAN: r0=212(x), r1=67(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 212
LDI r1, 67
LDI r2, 0x000000
PSET r0, r1, r2
HALT
