; DESCRIPTION: Sets a single magenta pixel at (417, 215).
; PLAN: r0=417(x), r1=215(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 417
LDI r1, 215
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
