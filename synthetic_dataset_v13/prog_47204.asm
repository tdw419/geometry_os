; DESCRIPTION: Sets a single purple pixel at (323, 196).
; PLAN: r0=323(x), r1=196(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 323
LDI r1, 196
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
