; DESCRIPTION: Sets a single purple pixel at (378, 252).
; PLAN: r0=378(x), r1=252(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 378
LDI r1, 252
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
