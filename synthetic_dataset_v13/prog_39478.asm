; DESCRIPTION: Sets a single purple pixel at (192, 40).
; PLAN: r0=192(x), r1=40(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 192
LDI r1, 40
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
