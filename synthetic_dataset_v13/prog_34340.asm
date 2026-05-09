; DESCRIPTION: Places a purple dot at position (15, 67).
; PLAN: r0=15(x), r1=67(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 15
LDI r1, 67
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
