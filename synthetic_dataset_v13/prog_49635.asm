; DESCRIPTION: Places a purple dot at position (405, 164).
; PLAN: r0=405(x), r1=164(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 405
LDI r1, 164
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
