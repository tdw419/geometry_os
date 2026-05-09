; DESCRIPTION: Sets a single purple pixel at (377, 19).
; PLAN: r0=377(x), r1=19(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 377
LDI r1, 19
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
