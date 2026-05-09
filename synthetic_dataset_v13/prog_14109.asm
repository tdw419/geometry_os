; DESCRIPTION: Places a blue dot at position (270, 0).
; PLAN: r0=270(x), r1=0(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 270
LDI r1, 0
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
