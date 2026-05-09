; DESCRIPTION: Sets a single purple pixel at (53, 63).
; PLAN: r0=53(x), r1=63(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 53
LDI r1, 63
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
