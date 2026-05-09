; DESCRIPTION: Places a blue circle of radius 53 at center (148, 110).
; PLAN: r0=148(x), r1=110(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 110
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
