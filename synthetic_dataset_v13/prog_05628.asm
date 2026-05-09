; DESCRIPTION: Places a purple dot at position (216, 78).
; PLAN: r0=216(x), r1=78(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 216
LDI r1, 78
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
