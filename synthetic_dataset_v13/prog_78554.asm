; DESCRIPTION: Sets a single magenta pixel at (285, 36).
; PLAN: r0=285(x), r1=36(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 285
LDI r1, 36
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
