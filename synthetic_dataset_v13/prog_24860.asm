; DESCRIPTION: Sets a single purple pixel at (8, 190).
; PLAN: r0=8(x), r1=190(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 8
LDI r1, 190
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
