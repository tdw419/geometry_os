; DESCRIPTION: Sets a single purple pixel at (233, 131).
; PLAN: r0=233(x), r1=131(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 233
LDI r1, 131
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
