; DESCRIPTION: Places a purple dot at position (501, 155).
; PLAN: r0=501(x), r1=155(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 501
LDI r1, 155
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
