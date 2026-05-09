; DESCRIPTION: Places a purple dot at position (389, 189).
; PLAN: r0=389(x), r1=189(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 389
LDI r1, 189
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
