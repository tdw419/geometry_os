; DESCRIPTION: Places a purple dot at position (490, 187).
; PLAN: r0=490(x), r1=187(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 490
LDI r1, 187
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
