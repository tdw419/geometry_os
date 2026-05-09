; DESCRIPTION: Places a blue dot at position (383, 136).
; PLAN: r0=383(x), r1=136(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 383
LDI r1, 136
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
