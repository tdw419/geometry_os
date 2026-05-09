; DESCRIPTION: Draws a white circle centered at (495, 86) with radius 12.
; PLAN: r0=495(x), r1=86(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 495
LDI r1, 86
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
