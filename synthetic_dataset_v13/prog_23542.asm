; DESCRIPTION: Places a purple dot at position (179, 81).
; PLAN: r0=179(x), r1=81(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 179
LDI r1, 81
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
