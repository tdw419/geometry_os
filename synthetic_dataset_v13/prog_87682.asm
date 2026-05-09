; DESCRIPTION: Places a black dot at position (439, 9).
; PLAN: r0=439(x), r1=9(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 439
LDI r1, 9
LDI r2, 0x000000
PSET r0, r1, r2
HALT
