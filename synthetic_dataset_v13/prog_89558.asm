; DESCRIPTION: Creates a blue circular shape at (308, 155) with radius 54.
; PLAN: r0=308(x), r1=155(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 155
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
