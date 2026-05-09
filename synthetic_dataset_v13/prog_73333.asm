; DESCRIPTION: Places a purple dot at position (419, 2).
; PLAN: r0=419(x), r1=2(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 419
LDI r1, 2
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
