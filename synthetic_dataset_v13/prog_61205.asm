; DESCRIPTION: Draws a white circle centered at (372, 88) with radius 27.
; PLAN: r0=372(x), r1=88(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 88
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
