; DESCRIPTION: Sets a single purple pixel at (261, 28).
; PLAN: r0=261(x), r1=28(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 261
LDI r1, 28
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
