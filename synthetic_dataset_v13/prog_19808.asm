; DESCRIPTION: Sets a single magenta pixel at (179, 210).
; PLAN: r0=179(x), r1=210(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 179
LDI r1, 210
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
