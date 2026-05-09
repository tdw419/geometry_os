; DESCRIPTION: Places a purple dot at position (166, 104).
; PLAN: r0=166(x), r1=104(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 166
LDI r1, 104
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
