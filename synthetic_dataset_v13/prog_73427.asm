; DESCRIPTION: Sets a single black pixel at (293, 39).
; PLAN: r0=293(x), r1=39(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 293
LDI r1, 39
LDI r2, 0x000000
PSET r0, r1, r2
HALT
