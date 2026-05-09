; DESCRIPTION: Sets a single magenta pixel at (181, 64).
; PLAN: r0=181(x), r1=64(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 181
LDI r1, 64
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
