; DESCRIPTION: Sets a single magenta pixel at (274, 162).
; PLAN: r0=274(x), r1=162(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 274
LDI r1, 162
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
