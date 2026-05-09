; DESCRIPTION: Sets a single magenta pixel at (421, 185).
; PLAN: r0=421(x), r1=185(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 421
LDI r1, 185
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
