; DESCRIPTION: Sets a single black pixel at (224, 38).
; PLAN: r0=224(x), r1=38(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 224
LDI r1, 38
LDI r2, 0x000000
PSET r0, r1, r2
HALT
