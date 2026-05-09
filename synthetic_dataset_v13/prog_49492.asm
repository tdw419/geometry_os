; DESCRIPTION: Sets a single magenta pixel at (10, 150).
; PLAN: r0=10(x), r1=150(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 10
LDI r1, 150
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
