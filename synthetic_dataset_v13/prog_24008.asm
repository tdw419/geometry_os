; DESCRIPTION: Places a purple dot at position (308, 140).
; PLAN: r0=308(x), r1=140(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 308
LDI r1, 140
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
