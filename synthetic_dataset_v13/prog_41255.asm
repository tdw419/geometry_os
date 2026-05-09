; DESCRIPTION: Sets a single magenta pixel at (70, 238).
; PLAN: r0=70(x), r1=238(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 238
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
