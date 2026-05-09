; DESCRIPTION: Sets a single purple pixel at (191, 12).
; PLAN: r0=191(x), r1=12(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 191
LDI r1, 12
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
