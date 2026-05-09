; DESCRIPTION: Sets a single black pixel at (501, 72).
; PLAN: r0=501(x), r1=72(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 501
LDI r1, 72
LDI r2, 0x000000
PSET r0, r1, r2
HALT
