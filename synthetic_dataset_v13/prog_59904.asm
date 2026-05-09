; DESCRIPTION: Sets a single purple pixel at (269, 217).
; PLAN: r0=269(x), r1=217(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 269
LDI r1, 217
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
