; DESCRIPTION: Places a purple dot at position (400, 30).
; PLAN: r0=400(x), r1=30(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 400
LDI r1, 30
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
