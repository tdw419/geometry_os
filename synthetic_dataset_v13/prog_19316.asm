; DESCRIPTION: Places a purple dot at position (429, 170).
; PLAN: r0=429(x), r1=170(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 429
LDI r1, 170
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
