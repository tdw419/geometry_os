; DESCRIPTION: Sets a single purple pixel at (472, 99).
; PLAN: r0=472(x), r1=99(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 472
LDI r1, 99
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
