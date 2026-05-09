; DESCRIPTION: Places a purple dot at position (508, 12).
; PLAN: r0=508(x), r1=12(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 508
LDI r1, 12
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
