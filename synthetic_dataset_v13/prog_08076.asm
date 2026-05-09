; DESCRIPTION: Creates a black circular shape at (416, 60) with radius 57.
; PLAN: r0=416(x), r1=60(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 60
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
