; DESCRIPTION: Creates a green circular shape at (400, 101) with radius 69.
; PLAN: r0=400(x), r1=101(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 101
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
