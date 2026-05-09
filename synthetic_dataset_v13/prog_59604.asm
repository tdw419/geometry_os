; DESCRIPTION: Sets a single magenta pixel at (195, 141).
; PLAN: r0=195(x), r1=141(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 195
LDI r1, 141
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
