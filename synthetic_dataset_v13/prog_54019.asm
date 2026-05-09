; DESCRIPTION: Sets a single magenta pixel at (120, 89).
; PLAN: r0=120(x), r1=89(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 120
LDI r1, 89
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
