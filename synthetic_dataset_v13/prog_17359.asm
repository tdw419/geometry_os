; DESCRIPTION: Places a blue dot at position (6, 13).
; PLAN: r0=6(x), r1=13(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 6
LDI r1, 13
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
