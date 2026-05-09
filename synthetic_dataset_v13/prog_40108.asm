; DESCRIPTION: Sets a single purple pixel at (127, 122).
; PLAN: r0=127(x), r1=122(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 127
LDI r1, 122
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
