; DESCRIPTION: Places a purple dot at position (125, 15).
; PLAN: r0=125(x), r1=15(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 125
LDI r1, 15
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
