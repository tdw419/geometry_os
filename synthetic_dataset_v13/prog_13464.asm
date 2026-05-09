; DESCRIPTION: Sets a single magenta pixel at (103, 88).
; PLAN: r0=103(x), r1=88(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 103
LDI r1, 88
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
