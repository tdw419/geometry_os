; DESCRIPTION: Sets a single magenta pixel at (9, 97).
; PLAN: r0=9(x), r1=97(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 9
LDI r1, 97
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
