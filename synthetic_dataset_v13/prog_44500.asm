; DESCRIPTION: Sets a single magenta pixel at (106, 245).
; PLAN: r0=106(x), r1=245(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 245
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
