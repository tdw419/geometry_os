; DESCRIPTION: Places a purple dot at position (143, 35).
; PLAN: r0=143(x), r1=35(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 143
LDI r1, 35
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
