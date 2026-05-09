; DESCRIPTION: Sets a single purple pixel at (177, 61).
; PLAN: r0=177(x), r1=61(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 61
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
