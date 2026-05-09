; DESCRIPTION: Sets a single magenta pixel at (331, 215).
; PLAN: r0=331(x), r1=215(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 331
LDI r1, 215
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
