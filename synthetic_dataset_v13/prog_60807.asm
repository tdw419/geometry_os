; DESCRIPTION: Creates a white circular shape at (490, 138) with radius 17.
; PLAN: r0=490(x), r1=138(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 490
LDI r1, 138
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
