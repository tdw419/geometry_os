; DESCRIPTION: Sets a single purple pixel at (353, 60).
; PLAN: r0=353(x), r1=60(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 353
LDI r1, 60
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
