; DESCRIPTION: Sets a single magenta pixel at (87, 71).
; PLAN: r0=87(x), r1=71(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 87
LDI r1, 71
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
