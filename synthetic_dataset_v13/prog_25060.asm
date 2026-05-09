; DESCRIPTION: Sets a single black pixel at (140, 153).
; PLAN: r0=140(x), r1=153(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 140
LDI r1, 153
LDI r2, 0x000000
PSET r0, r1, r2
HALT
