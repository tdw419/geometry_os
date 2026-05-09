; DESCRIPTION: Places a purple dot at position (453, 68).
; PLAN: r0=453(x), r1=68(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 453
LDI r1, 68
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
