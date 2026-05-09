; DESCRIPTION: Places a purple dot at position (185, 145).
; PLAN: r0=185(x), r1=145(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 185
LDI r1, 145
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
