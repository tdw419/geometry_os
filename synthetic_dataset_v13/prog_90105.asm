; DESCRIPTION: Creates a blue circular shape at (88, 224) with radius 16.
; PLAN: r0=88(x), r1=224(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 224
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
