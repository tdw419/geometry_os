; DESCRIPTION: Sets a single magenta pixel at (509, 45).
; PLAN: r0=509(x), r1=45(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 509
LDI r1, 45
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
