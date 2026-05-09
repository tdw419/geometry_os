; DESCRIPTION: Sets a single magenta pixel at (46, 19).
; PLAN: r0=46(x), r1=19(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 46
LDI r1, 19
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
