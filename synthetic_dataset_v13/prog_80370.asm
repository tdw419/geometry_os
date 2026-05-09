; DESCRIPTION: Creates a blue circular shape at (102, 84) with radius 20.
; PLAN: r0=102(x), r1=84(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 84
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
