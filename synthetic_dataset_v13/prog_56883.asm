; DESCRIPTION: Places a blue dot at position (361, 245).
; PLAN: r0=361(x), r1=245(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 361
LDI r1, 245
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
