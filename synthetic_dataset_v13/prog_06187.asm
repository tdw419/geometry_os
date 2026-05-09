; DESCRIPTION: Sets a single magenta pixel at (5, 34).
; PLAN: r0=5(x), r1=34(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 5
LDI r1, 34
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
