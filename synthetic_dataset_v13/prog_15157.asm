; DESCRIPTION: Draws a white circle centered at (86, 172) with radius 14.
; PLAN: r0=86(x), r1=172(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 172
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
