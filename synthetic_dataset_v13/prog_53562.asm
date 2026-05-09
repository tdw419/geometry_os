; DESCRIPTION: Sets a single black pixel at (471, 48).
; PLAN: r0=471(x), r1=48(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 471
LDI r1, 48
LDI r2, 0x000000
PSET r0, r1, r2
HALT
