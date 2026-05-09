; DESCRIPTION: Places a black dot at position (201, 201).
; PLAN: r0=201(x), r1=201(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 201
LDI r1, 201
LDI r2, 0x000000
PSET r0, r1, r2
HALT
