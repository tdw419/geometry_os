; DESCRIPTION: Sets a single purple pixel at (354, 130).
; PLAN: r0=354(x), r1=130(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 354
LDI r1, 130
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
