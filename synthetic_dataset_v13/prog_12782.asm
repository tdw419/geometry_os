; DESCRIPTION: Places a blue dot at position (364, 53).
; PLAN: r0=364(x), r1=53(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 364
LDI r1, 53
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
