; DESCRIPTION: Sets a single magenta pixel at (224, 234).
; PLAN: r0=224(x), r1=234(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 224
LDI r1, 234
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
