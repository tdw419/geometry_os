; DESCRIPTION: Places a blue circle of radius 33 at center (315, 114).
; PLAN: r0=315(x), r1=114(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 114
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
