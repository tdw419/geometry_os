; DESCRIPTION: Sets a single purple pixel at (130, 117).
; PLAN: r0=130(x), r1=117(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 130
LDI r1, 117
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
