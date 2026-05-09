; DESCRIPTION: Places a purple dot at position (47, 28).
; PLAN: r0=47(x), r1=28(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 47
LDI r1, 28
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
