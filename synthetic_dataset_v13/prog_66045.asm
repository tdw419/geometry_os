; DESCRIPTION: Creates a black circular shape at (65, 181) with radius 59.
; PLAN: r0=65(x), r1=181(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 181
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
