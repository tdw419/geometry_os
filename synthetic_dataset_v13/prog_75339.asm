; DESCRIPTION: Sets a single purple pixel at (297, 132).
; PLAN: r0=297(x), r1=132(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 297
LDI r1, 132
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
