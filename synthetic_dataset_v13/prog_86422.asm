; DESCRIPTION: Places a purple dot at position (407, 46).
; PLAN: r0=407(x), r1=46(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 407
LDI r1, 46
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
