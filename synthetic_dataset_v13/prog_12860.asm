; DESCRIPTION: Draws a white circle centered at (334, 175) with radius 16.
; PLAN: r0=334(x), r1=175(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 175
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
