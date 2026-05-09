; DESCRIPTION: Places a blue dot at position (76, 181).
; PLAN: r0=76(x), r1=181(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 76
LDI r1, 181
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
