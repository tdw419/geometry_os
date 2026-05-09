; DESCRIPTION: Places a purple dot at position (471, 31).
; PLAN: r0=471(x), r1=31(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 471
LDI r1, 31
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
