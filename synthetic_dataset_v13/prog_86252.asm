; DESCRIPTION: Creates a blue circular shape at (194, 198) with radius 46.
; PLAN: r0=194(x), r1=198(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 198
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
