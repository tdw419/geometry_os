; DESCRIPTION: Sets a single magenta pixel at (250, 27).
; PLAN: r0=250(x), r1=27(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 250
LDI r1, 27
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
