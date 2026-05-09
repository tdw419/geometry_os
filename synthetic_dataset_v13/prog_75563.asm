; DESCRIPTION: Places a purple dot at position (402, 65).
; PLAN: r0=402(x), r1=65(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 402
LDI r1, 65
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
