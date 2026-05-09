; DESCRIPTION: Places a black dot at position (336, 224).
; PLAN: r0=336(x), r1=224(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 336
LDI r1, 224
LDI r2, 0x000000
PSET r0, r1, r2
HALT
