; DESCRIPTION: Creates a blue circular shape at (303, 110) with radius 76.
; PLAN: r0=303(x), r1=110(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 110
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
