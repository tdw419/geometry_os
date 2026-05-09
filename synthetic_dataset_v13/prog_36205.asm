; DESCRIPTION: Places a blue dot at position (131, 39).
; PLAN: r0=131(x), r1=39(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 131
LDI r1, 39
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
