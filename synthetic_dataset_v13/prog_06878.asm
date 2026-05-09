; DESCRIPTION: Places a blue dot at position (76, 133).
; PLAN: r0=76(x), r1=133(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 76
LDI r1, 133
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
