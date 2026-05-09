; DESCRIPTION: Places a blue dot at position (129, 8).
; PLAN: r0=129(x), r1=8(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 129
LDI r1, 8
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
