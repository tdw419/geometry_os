; DESCRIPTION: Places a purple dot at position (395, 119).
; PLAN: r0=395(x), r1=119(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 395
LDI r1, 119
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
