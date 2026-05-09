; DESCRIPTION: Sets a single purple pixel at (351, 220).
; PLAN: r0=351(x), r1=220(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 351
LDI r1, 220
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
