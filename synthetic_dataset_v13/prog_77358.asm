; DESCRIPTION: Places a blue circle of radius 25 at center (100, 136).
; PLAN: r0=100(x), r1=136(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 136
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
