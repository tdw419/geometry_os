; DESCRIPTION: Places a purple dot at position (429, 97).
; PLAN: r0=429(x), r1=97(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 429
LDI r1, 97
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
