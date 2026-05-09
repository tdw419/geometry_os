; DESCRIPTION: Places a purple dot at position (175, 11).
; PLAN: r0=175(x), r1=11(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 175
LDI r1, 11
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
