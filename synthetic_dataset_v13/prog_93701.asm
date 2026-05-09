; DESCRIPTION: Creates a blue circular shape at (143, 102) with radius 69.
; PLAN: r0=143(x), r1=102(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 102
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
