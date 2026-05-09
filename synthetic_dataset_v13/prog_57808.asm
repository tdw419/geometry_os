; DESCRIPTION: Creates a black circular shape at (218, 181) with radius 69.
; PLAN: r0=218(x), r1=181(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 181
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
