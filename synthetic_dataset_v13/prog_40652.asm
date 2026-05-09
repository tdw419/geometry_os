; DESCRIPTION: Places a yellow dot at position (201, 196).
; PLAN: r0=201(x), r1=196(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 201
LDI r1, 196
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
