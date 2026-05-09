; DESCRIPTION: Sets a single magenta pixel at (108, 86).
; PLAN: r0=108(x), r1=86(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 86
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
