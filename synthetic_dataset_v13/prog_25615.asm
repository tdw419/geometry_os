; DESCRIPTION: Sets a single purple pixel at (385, 30).
; PLAN: r0=385(x), r1=30(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 385
LDI r1, 30
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
