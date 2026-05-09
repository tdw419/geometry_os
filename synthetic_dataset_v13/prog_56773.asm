; DESCRIPTION: Sets a single black pixel at (491, 159).
; PLAN: r0=491(x), r1=159(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 491
LDI r1, 159
LDI r2, 0x000000
PSET r0, r1, r2
HALT
