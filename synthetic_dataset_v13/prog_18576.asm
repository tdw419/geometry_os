; DESCRIPTION: Places a purple dot at position (405, 197).
; PLAN: r0=405(x), r1=197(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 405
LDI r1, 197
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
