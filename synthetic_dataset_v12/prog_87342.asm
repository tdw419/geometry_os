; DESCRIPTION: Sets a single magenta pixel at (405, 191).
; PLAN: r0=405(x), r1=191(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 405
LDI r1, 191
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
