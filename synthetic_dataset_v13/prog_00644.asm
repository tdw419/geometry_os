; DESCRIPTION: Places a purple dot at position (167, 224).
; PLAN: r0=167(x), r1=224(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 167
LDI r1, 224
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
