; DESCRIPTION: Places a black dot at position (321, 89).
; PLAN: r0=321(x), r1=89(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 321
LDI r1, 89
LDI r2, 0x000000
PSET r0, r1, r2
HALT
