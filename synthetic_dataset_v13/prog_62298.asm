; DESCRIPTION: Places a black dot at position (61, 199).
; PLAN: r0=61(x), r1=199(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 61
LDI r1, 199
LDI r2, 0x000000
PSET r0, r1, r2
HALT
