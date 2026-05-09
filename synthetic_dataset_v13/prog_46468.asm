; DESCRIPTION: Sets a single magenta pixel at (498, 65).
; PLAN: r0=498(x), r1=65(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 498
LDI r1, 65
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
