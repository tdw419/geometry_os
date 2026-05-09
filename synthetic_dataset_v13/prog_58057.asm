; DESCRIPTION: Sets a single black pixel at (258, 48).
; PLAN: r0=258(x), r1=48(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 258
LDI r1, 48
LDI r2, 0x000000
PSET r0, r1, r2
HALT
