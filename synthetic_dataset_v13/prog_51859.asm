; DESCRIPTION: Creates a blue circular shape at (188, 103) with radius 62.
; PLAN: r0=188(x), r1=103(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 103
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
