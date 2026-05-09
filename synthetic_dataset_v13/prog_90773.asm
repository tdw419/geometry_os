; DESCRIPTION: Places a purple dot at position (435, 90).
; PLAN: r0=435(x), r1=90(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 435
LDI r1, 90
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
