; DESCRIPTION: Sets a single magenta pixel at (83, 249).
; PLAN: r0=83(x), r1=249(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 83
LDI r1, 249
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
