; DESCRIPTION: Places a blue dot at position (127, 227).
; PLAN: r0=127(x), r1=227(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 127
LDI r1, 227
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
