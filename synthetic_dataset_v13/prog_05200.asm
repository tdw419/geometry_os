; DESCRIPTION: Sets a single purple pixel at (12, 103).
; PLAN: r0=12(x), r1=103(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 12
LDI r1, 103
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
