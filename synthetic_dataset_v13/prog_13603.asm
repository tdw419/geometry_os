; DESCRIPTION: Creates a blue circular shape at (416, 174) with radius 75.
; PLAN: r0=416(x), r1=174(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 174
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
