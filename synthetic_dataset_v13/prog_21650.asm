; DESCRIPTION: Places a black dot at position (477, 230).
; PLAN: r0=477(x), r1=230(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 477
LDI r1, 230
LDI r2, 0x000000
PSET r0, r1, r2
HALT
