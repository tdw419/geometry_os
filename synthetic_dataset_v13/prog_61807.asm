; DESCRIPTION: Creates a blue circular shape at (69, 181) with radius 55.
; PLAN: r0=69(x), r1=181(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 181
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
