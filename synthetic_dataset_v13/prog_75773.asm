; DESCRIPTION: Sets a single magenta pixel at (337, 98).
; PLAN: r0=337(x), r1=98(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 337
LDI r1, 98
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
