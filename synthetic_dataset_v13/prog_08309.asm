; DESCRIPTION: Sets a single blue pixel at (507, 250).
; PLAN: r0=507(x), r1=250(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 507
LDI r1, 250
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
