; DESCRIPTION: Places a blue dot at position (370, 114).
; PLAN: r0=370(x), r1=114(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 370
LDI r1, 114
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
