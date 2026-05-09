; DESCRIPTION: Sets a single red pixel at (50, 224).
; PLAN: r0=50(x), r1=224(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 50
LDI r1, 224
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
