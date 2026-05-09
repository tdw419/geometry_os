; DESCRIPTION: Places a blue dot at position (324, 136).
; PLAN: r0=324(x), r1=136(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 324
LDI r1, 136
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
