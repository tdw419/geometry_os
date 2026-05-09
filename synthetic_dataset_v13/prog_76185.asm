; DESCRIPTION: Places a purple dot at position (462, 75).
; PLAN: r0=462(x), r1=75(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 462
LDI r1, 75
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
