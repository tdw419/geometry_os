; DESCRIPTION: Places a purple dot at position (500, 179).
; PLAN: r0=500(x), r1=179(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 500
LDI r1, 179
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
