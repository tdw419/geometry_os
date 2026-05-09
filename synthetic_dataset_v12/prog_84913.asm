; DESCRIPTION: Sets a single purple pixel at (184, 66).
; PLAN: r0=184(x), r1=66(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 184
LDI r1, 66
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
