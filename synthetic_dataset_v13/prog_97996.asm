; DESCRIPTION: Places a black dot at position (463, 251).
; PLAN: r0=463(x), r1=251(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 463
LDI r1, 251
LDI r2, 0x000000
PSET r0, r1, r2
HALT
