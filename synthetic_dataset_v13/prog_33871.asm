; DESCRIPTION: Sets a single magenta pixel at (93, 64).
; PLAN: r0=93(x), r1=64(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 93
LDI r1, 64
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
