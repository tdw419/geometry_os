; DESCRIPTION: Places a blue circle of radius 17 at center (19, 33).
; PLAN: r0=19(x), r1=33(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 19
LDI r1, 33
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
