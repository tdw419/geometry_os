; DESCRIPTION: Places a purple dot at position (77, 131).
; PLAN: r0=77(x), r1=131(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 77
LDI r1, 131
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
