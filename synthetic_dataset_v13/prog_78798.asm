; DESCRIPTION: Places a blue dot at position (142, 139).
; PLAN: r0=142(x), r1=139(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 142
LDI r1, 139
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
