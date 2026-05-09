; DESCRIPTION: Places a purple dot at position (103, 224).
; PLAN: r0=103(x), r1=224(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 103
LDI r1, 224
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
