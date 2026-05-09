; DESCRIPTION: Sets a single purple pixel at (461, 151).
; PLAN: r0=461(x), r1=151(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 461
LDI r1, 151
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
