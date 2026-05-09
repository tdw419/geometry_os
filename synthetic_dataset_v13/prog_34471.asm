; DESCRIPTION: Sets a single purple pixel at (256, 252).
; PLAN: r0=256(x), r1=252(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 256
LDI r1, 252
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
