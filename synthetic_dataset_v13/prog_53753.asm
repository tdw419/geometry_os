; DESCRIPTION: Sets a single magenta pixel at (346, 9).
; PLAN: r0=346(x), r1=9(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 346
LDI r1, 9
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
