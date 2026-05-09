; DESCRIPTION: Sets a single magenta pixel at (233, 172).
; PLAN: r0=233(x), r1=172(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 233
LDI r1, 172
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
