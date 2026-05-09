; DESCRIPTION: Sets a single magenta pixel at (487, 23).
; PLAN: r0=487(x), r1=23(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 487
LDI r1, 23
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
