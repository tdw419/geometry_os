; DESCRIPTION: Places a blue dot at position (377, 23).
; PLAN: r0=377(x), r1=23(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 377
LDI r1, 23
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
