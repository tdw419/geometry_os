; DESCRIPTION: Sets a single magenta pixel at (72, 182).
; PLAN: r0=72(x), r1=182(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 72
LDI r1, 182
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
