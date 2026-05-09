; DESCRIPTION: Sets a single purple pixel at (56, 25).
; PLAN: r0=56(x), r1=25(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 56
LDI r1, 25
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
