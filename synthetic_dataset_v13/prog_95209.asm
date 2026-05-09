; DESCRIPTION: Sets a single purple pixel at (314, 159).
; PLAN: r0=314(x), r1=159(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 314
LDI r1, 159
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
