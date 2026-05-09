; DESCRIPTION: Creates a black circular shape at (191, 126) with radius 69.
; PLAN: r0=191(x), r1=126(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 126
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
