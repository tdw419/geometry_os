; DESCRIPTION: Places a blue dot at position (306, 22).
; PLAN: r0=306(x), r1=22(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 306
LDI r1, 22
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
