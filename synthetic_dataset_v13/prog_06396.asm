; DESCRIPTION: Draws a white circle centered at (78, 86) with radius 44.
; PLAN: r0=78(x), r1=86(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 86
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
