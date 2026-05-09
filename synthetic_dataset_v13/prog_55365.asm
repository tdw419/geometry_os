; DESCRIPTION: Creates a blue circular shape at (402, 29) with radius 28.
; PLAN: r0=402(x), r1=29(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 29
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
