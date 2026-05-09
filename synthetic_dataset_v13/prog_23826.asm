; DESCRIPTION: Sets a single purple pixel at (323, 46).
; PLAN: r0=323(x), r1=46(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 323
LDI r1, 46
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
