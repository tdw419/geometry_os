; DESCRIPTION: Places a blue circle of radius 76 at center (148, 106).
; PLAN: r0=148(x), r1=106(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 106
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
