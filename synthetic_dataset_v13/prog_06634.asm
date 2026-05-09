; DESCRIPTION: Places a blue dot at position (385, 0).
; PLAN: r0=385(x), r1=0(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 385
LDI r1, 0
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
