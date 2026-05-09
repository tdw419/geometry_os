; DESCRIPTION: Sets a single purple pixel at (122, 180).
; PLAN: r0=122(x), r1=180(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 122
LDI r1, 180
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
