; DESCRIPTION: Places a blue circle of radius 36 at center (66, 114).
; PLAN: r0=66(x), r1=114(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 114
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
