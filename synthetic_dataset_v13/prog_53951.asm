; DESCRIPTION: Places a blue dot at position (448, 175).
; PLAN: r0=448(x), r1=175(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 448
LDI r1, 175
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
