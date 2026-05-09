; DESCRIPTION: Creates a blue circular shape at (416, 144) with radius 28.
; PLAN: r0=416(x), r1=144(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 144
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
