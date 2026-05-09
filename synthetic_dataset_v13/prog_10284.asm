; DESCRIPTION: Sets a single purple pixel at (318, 106).
; PLAN: r0=318(x), r1=106(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 318
LDI r1, 106
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
