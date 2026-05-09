; DESCRIPTION: Places a purple dot at position (261, 44).
; PLAN: r0=261(x), r1=44(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 261
LDI r1, 44
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
