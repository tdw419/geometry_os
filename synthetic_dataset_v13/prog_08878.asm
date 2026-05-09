; DESCRIPTION: Sets a single black pixel at (318, 199).
; PLAN: r0=318(x), r1=199(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 318
LDI r1, 199
LDI r2, 0x000000
PSET r0, r1, r2
HALT
