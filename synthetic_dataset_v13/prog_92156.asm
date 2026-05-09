; DESCRIPTION: Sets a single purple pixel at (287, 101).
; PLAN: r0=287(x), r1=101(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 287
LDI r1, 101
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
