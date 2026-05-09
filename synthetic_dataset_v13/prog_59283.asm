; DESCRIPTION: Sets a single magenta pixel at (125, 72).
; PLAN: r0=125(x), r1=72(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 125
LDI r1, 72
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
