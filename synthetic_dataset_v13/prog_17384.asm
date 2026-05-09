; DESCRIPTION: Sets a single magenta pixel at (37, 161).
; PLAN: r0=37(x), r1=161(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 37
LDI r1, 161
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
