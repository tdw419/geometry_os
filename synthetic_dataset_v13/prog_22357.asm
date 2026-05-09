; DESCRIPTION: Sets a single purple pixel at (452, 132).
; PLAN: r0=452(x), r1=132(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 452
LDI r1, 132
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
