; DESCRIPTION: Places a blue circle of radius 43 at center (313, 157).
; PLAN: r0=313(x), r1=157(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 157
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
