; DESCRIPTION: Places a black dot at position (433, 157).
; PLAN: r0=433(x), r1=157(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 433
LDI r1, 157
LDI r2, 0x000000
PSET r0, r1, r2
HALT
