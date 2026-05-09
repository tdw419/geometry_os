; DESCRIPTION: Draws a white circle centered at (375, 20) with radius 19.
; PLAN: r0=375(x), r1=20(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 20
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
