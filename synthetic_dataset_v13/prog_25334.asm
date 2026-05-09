; DESCRIPTION: Sets a single magenta pixel at (362, 62).
; PLAN: r0=362(x), r1=62(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 362
LDI r1, 62
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
