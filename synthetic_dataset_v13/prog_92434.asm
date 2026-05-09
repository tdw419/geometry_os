; DESCRIPTION: Places a red dot at position (477, 140).
; PLAN: r0=477(x), r1=140(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 477
LDI r1, 140
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
