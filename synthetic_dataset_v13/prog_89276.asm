; DESCRIPTION: Sets a single magenta pixel at (194, 31).
; PLAN: r0=194(x), r1=31(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 194
LDI r1, 31
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
