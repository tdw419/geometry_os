; DESCRIPTION: Places a purple dot at position (13, 234).
; PLAN: r0=13(x), r1=234(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 13
LDI r1, 234
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
