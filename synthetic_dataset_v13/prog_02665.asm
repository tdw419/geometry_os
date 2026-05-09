; DESCRIPTION: Sets a single magenta pixel at (311, 179).
; PLAN: r0=311(x), r1=179(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 311
LDI r1, 179
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
