; DESCRIPTION: Sets a single magenta pixel at (93, 116).
; PLAN: r0=93(x), r1=116(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 93
LDI r1, 116
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
