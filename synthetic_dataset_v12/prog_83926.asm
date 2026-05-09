; DESCRIPTION: Places a blue circle of radius 55 at center (297, 100).
; PLAN: r0=297(x), r1=100(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 100
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
