; DESCRIPTION: Sets a single magenta pixel at (71, 245).
; PLAN: r0=71(x), r1=245(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 71
LDI r1, 245
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
