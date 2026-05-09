; DESCRIPTION: Sets a single magenta pixel at (389, 99).
; PLAN: r0=389(x), r1=99(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 389
LDI r1, 99
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
