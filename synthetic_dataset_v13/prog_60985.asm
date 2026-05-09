; DESCRIPTION: Places a black dot at position (356, 147).
; PLAN: r0=356(x), r1=147(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 356
LDI r1, 147
LDI r2, 0x000000
PSET r0, r1, r2
HALT
