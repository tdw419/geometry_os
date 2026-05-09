; DESCRIPTION: Sets a single magenta pixel at (165, 29).
; PLAN: r0=165(x), r1=29(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 165
LDI r1, 29
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
