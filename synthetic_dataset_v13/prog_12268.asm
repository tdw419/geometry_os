; DESCRIPTION: Sets a single purple pixel at (417, 209).
; PLAN: r0=417(x), r1=209(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 417
LDI r1, 209
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
