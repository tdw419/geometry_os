; DESCRIPTION: Sets a single black pixel at (136, 76).
; PLAN: r0=136(x), r1=76(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 136
LDI r1, 76
LDI r2, 0x000000
PSET r0, r1, r2
HALT
