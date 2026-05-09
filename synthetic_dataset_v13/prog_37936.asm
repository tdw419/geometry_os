; DESCRIPTION: Places a purple dot at position (138, 106).
; PLAN: r0=138(x), r1=106(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 138
LDI r1, 106
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
