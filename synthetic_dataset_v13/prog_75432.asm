; DESCRIPTION: Sets a single magenta pixel at (215, 175).
; PLAN: r0=215(x), r1=175(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 215
LDI r1, 175
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
