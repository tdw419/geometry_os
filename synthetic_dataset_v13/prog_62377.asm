; DESCRIPTION: Sets a single magenta pixel at (49, 124).
; PLAN: r0=49(x), r1=124(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 49
LDI r1, 124
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
