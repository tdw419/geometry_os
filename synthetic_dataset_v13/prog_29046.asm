; DESCRIPTION: Places a purple dot at position (400, 68).
; PLAN: r0=400(x), r1=68(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 400
LDI r1, 68
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
