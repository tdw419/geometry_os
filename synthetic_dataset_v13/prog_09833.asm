; DESCRIPTION: Sets a single magenta pixel at (256, 179).
; PLAN: r0=256(x), r1=179(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 256
LDI r1, 179
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
