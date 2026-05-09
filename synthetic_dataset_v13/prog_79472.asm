; DESCRIPTION: Places a blue dot at position (276, 245).
; PLAN: r0=276(x), r1=245(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 276
LDI r1, 245
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
