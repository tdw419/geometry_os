; DESCRIPTION: Places a purple dot at position (317, 145).
; PLAN: r0=317(x), r1=145(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 317
LDI r1, 145
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
