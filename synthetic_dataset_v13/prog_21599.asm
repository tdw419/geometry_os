; DESCRIPTION: Places a purple dot at position (383, 172).
; PLAN: r0=383(x), r1=172(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 383
LDI r1, 172
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
