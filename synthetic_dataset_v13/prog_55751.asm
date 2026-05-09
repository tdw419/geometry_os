; DESCRIPTION: Sets a single magenta pixel at (238, 212).
; PLAN: r0=238(x), r1=212(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 238
LDI r1, 212
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
