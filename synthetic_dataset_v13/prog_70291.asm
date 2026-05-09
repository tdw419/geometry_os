; DESCRIPTION: Places a purple dot at position (14, 56).
; PLAN: r0=14(x), r1=56(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 14
LDI r1, 56
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
