; DESCRIPTION: Creates a blue circular shape at (184, 170) with radius 55.
; PLAN: r0=184(x), r1=170(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 170
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
