; DESCRIPTION: Places a red dot at position (351, 181).
; PLAN: r0=351(x), r1=181(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 351
LDI r1, 181
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
