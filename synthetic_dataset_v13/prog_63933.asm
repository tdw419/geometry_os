; DESCRIPTION: Places a purple dot at position (25, 20).
; PLAN: r0=25(x), r1=20(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 25
LDI r1, 20
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
