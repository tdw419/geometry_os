; DESCRIPTION: Draws a white circle centered at (372, 123) with radius 18.
; PLAN: r0=372(x), r1=123(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 123
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
