; DESCRIPTION: Sets a single magenta pixel at (341, 247).
; PLAN: r0=341(x), r1=247(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 341
LDI r1, 247
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
