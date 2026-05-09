; DESCRIPTION: Places a blue dot at position (130, 222).
; PLAN: r0=130(x), r1=222(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 130
LDI r1, 222
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
