; DESCRIPTION: Sets a single purple pixel at (103, 216).
; PLAN: r0=103(x), r1=216(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 103
LDI r1, 216
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
