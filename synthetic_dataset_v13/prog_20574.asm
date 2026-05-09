; DESCRIPTION: Sets a single orange pixel at (507, 224).
; PLAN: r0=507(x), r1=224(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 507
LDI r1, 224
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
