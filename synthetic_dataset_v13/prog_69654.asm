; DESCRIPTION: Places a purple dot at position (200, 233).
; PLAN: r0=200(x), r1=233(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 200
LDI r1, 233
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
