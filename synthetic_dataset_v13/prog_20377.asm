; DESCRIPTION: Sets a single black pixel at (511, 40).
; PLAN: r0=511(x), r1=40(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 511
LDI r1, 40
LDI r2, 0x000000
PSET r0, r1, r2
HALT
