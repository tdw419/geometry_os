; DESCRIPTION: Sets a single purple pixel at (279, 245).
; PLAN: r0=279(x), r1=245(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 279
LDI r1, 245
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
