; DESCRIPTION: Sets a single purple pixel at (124, 68).
; PLAN: r0=124(x), r1=68(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 124
LDI r1, 68
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
