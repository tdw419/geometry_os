; DESCRIPTION: Places a blue dot at position (159, 139).
; PLAN: r0=159(x), r1=139(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 159
LDI r1, 139
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
