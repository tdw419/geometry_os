; DESCRIPTION: Sets a single magenta pixel at (392, 14).
; PLAN: r0=392(x), r1=14(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 392
LDI r1, 14
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
