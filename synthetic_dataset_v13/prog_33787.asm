; DESCRIPTION: Draws a white circle centered at (310, 149) with radius 38.
; PLAN: r0=310(x), r1=149(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 149
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
