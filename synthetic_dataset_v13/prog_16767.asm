; DESCRIPTION: Draws a white circle centered at (430, 123) with radius 55.
; PLAN: r0=430(x), r1=123(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 123
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
