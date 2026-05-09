; DESCRIPTION: Places a black dot at position (417, 3).
; PLAN: r0=417(x), r1=3(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 417
LDI r1, 3
LDI r2, 0x000000
PSET r0, r1, r2
HALT
