; DESCRIPTION: Draws a white circle centered at (223, 130) with radius 70.
; PLAN: r0=223(x), r1=130(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 130
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
