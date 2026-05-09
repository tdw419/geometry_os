; DESCRIPTION: Sets a single green pixel at (93, 224).
; PLAN: r0=93(x), r1=224(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 93
LDI r1, 224
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
