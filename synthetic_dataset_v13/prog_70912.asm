; DESCRIPTION: Places a blue dot at position (155, 62).
; PLAN: r0=155(x), r1=62(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 155
LDI r1, 62
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
