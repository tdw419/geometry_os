; DESCRIPTION: Places a blue dot at position (478, 127).
; PLAN: r0=478(x), r1=127(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 478
LDI r1, 127
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
