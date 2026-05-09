; DESCRIPTION: Sets a single magenta pixel at (201, 47).
; PLAN: r0=201(x), r1=47(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 201
LDI r1, 47
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
