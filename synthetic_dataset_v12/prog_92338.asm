; DESCRIPTION: Creates a blue circular shape at (217, 155) with radius 40.
; PLAN: r0=217(x), r1=155(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 155
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
