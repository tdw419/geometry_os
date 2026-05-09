; DESCRIPTION: Places a black dot at position (476, 233).
; PLAN: r0=476(x), r1=233(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 476
LDI r1, 233
LDI r2, 0x000000
PSET r0, r1, r2
HALT
