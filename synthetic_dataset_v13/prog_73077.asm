; DESCRIPTION: Places a yellow dot at position (234, 201).
; PLAN: r0=234(x), r1=201(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 234
LDI r1, 201
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
