; DESCRIPTION: Sets a single magenta pixel at (222, 69).
; PLAN: r0=222(x), r1=69(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 222
LDI r1, 69
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
