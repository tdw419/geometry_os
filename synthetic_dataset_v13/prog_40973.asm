; DESCRIPTION: Places a purple dot at position (431, 69).
; PLAN: r0=431(x), r1=69(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 431
LDI r1, 69
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
