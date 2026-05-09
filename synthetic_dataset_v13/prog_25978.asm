; DESCRIPTION: Sets a single magenta pixel at (429, 207).
; PLAN: r0=429(x), r1=207(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 429
LDI r1, 207
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
