; DESCRIPTION: Places a blue dot at position (397, 106).
; PLAN: r0=397(x), r1=106(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 397
LDI r1, 106
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
