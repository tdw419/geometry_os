; DESCRIPTION: Creates a blue circular shape at (312, 223) with radius 29.
; PLAN: r0=312(x), r1=223(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 223
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
