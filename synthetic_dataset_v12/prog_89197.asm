; DESCRIPTION: Sets a single magenta pixel at (372, 217).
; PLAN: r0=372(x), r1=217(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 372
LDI r1, 217
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
