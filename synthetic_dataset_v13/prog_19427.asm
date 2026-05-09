; DESCRIPTION: Places a blue dot at position (72, 232).
; PLAN: r0=72(x), r1=232(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 72
LDI r1, 232
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
