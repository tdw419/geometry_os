; DESCRIPTION: Sets a single magenta pixel at (117, 76).
; PLAN: r0=117(x), r1=76(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 117
LDI r1, 76
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
