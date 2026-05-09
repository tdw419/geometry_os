; DESCRIPTION: Sets a single black pixel at (477, 169).
; PLAN: r0=477(x), r1=169(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 477
LDI r1, 169
LDI r2, 0x000000
PSET r0, r1, r2
HALT
