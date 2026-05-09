; DESCRIPTION: Places a blue circle of radius 35 at center (123, 148).
; PLAN: r0=123(x), r1=148(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 148
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
