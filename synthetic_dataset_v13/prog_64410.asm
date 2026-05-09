; DESCRIPTION: Places a purple dot at position (51, 80).
; PLAN: r0=51(x), r1=80(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 80
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
