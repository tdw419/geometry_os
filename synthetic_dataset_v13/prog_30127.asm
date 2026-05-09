; DESCRIPTION: Places a black dot at position (56, 240).
; PLAN: r0=56(x), r1=240(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 56
LDI r1, 240
LDI r2, 0x000000
PSET r0, r1, r2
HALT
