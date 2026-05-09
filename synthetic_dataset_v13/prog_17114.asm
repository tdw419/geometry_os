; DESCRIPTION: Creates a blue circular shape at (430, 135) with radius 69.
; PLAN: r0=430(x), r1=135(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 135
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
