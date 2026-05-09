; DESCRIPTION: Sets a single black pixel at (257, 24).
; PLAN: r0=257(x), r1=24(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 257
LDI r1, 24
LDI r2, 0x000000
PSET r0, r1, r2
HALT
