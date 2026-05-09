; DESCRIPTION: Sets a single magenta pixel at (414, 181).
; PLAN: r0=414(x), r1=181(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 414
LDI r1, 181
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
