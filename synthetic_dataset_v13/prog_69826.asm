; DESCRIPTION: Sets a single purple pixel at (195, 136).
; PLAN: r0=195(x), r1=136(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 195
LDI r1, 136
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
