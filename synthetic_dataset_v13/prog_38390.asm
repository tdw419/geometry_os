; DESCRIPTION: Places a purple dot at position (475, 51).
; PLAN: r0=475(x), r1=51(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 475
LDI r1, 51
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
