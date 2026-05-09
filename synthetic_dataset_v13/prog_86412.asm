; DESCRIPTION: Places a blue circle of radius 37 at center (114, 191).
; PLAN: r0=114(x), r1=191(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 191
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
