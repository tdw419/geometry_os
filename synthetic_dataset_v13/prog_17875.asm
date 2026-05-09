; DESCRIPTION: Creates a blue circular shape at (270, 69) with radius 46.
; PLAN: r0=270(x), r1=69(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 69
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
