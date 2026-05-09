; DESCRIPTION: Places a blue dot at position (476, 46).
; PLAN: r0=476(x), r1=46(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 476
LDI r1, 46
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
