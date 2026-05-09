; DESCRIPTION: Sets a single purple pixel at (103, 17).
; PLAN: r0=103(x), r1=17(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 103
LDI r1, 17
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
