; DESCRIPTION: Places a purple dot at position (366, 46).
; PLAN: r0=366(x), r1=46(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 366
LDI r1, 46
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
