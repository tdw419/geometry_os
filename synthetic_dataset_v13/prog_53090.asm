; DESCRIPTION: Sets a single magenta pixel at (105, 82).
; PLAN: r0=105(x), r1=82(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 105
LDI r1, 82
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
