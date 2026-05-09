; DESCRIPTION: Creates a yellow circular shape at (375, 179) with radius 69.
; PLAN: r0=375(x), r1=179(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 179
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
