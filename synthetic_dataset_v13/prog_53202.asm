; DESCRIPTION: Sets a single magenta pixel at (147, 78).
; PLAN: r0=147(x), r1=78(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 147
LDI r1, 78
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
