; DESCRIPTION: Sets a single black pixel at (325, 166).
; PLAN: r0=325(x), r1=166(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 325
LDI r1, 166
LDI r2, 0x000000
PSET r0, r1, r2
HALT
