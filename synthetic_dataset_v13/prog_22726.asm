; DESCRIPTION: Sets a single magenta pixel at (308, 4).
; PLAN: r0=308(x), r1=4(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 308
LDI r1, 4
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
