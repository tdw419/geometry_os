; DESCRIPTION: Draws a white circle centered at (495, 17) with radius 14.
; PLAN: r0=495(x), r1=17(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 495
LDI r1, 17
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
