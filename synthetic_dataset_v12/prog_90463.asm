; DESCRIPTION: Places a blue dot at position (185, 90).
; PLAN: r0=185(x), r1=90(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 185
LDI r1, 90
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
