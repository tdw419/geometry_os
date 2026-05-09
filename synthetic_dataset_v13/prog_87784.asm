; DESCRIPTION: Places a purple dot at position (292, 15).
; PLAN: r0=292(x), r1=15(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 292
LDI r1, 15
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
