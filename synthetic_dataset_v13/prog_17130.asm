; DESCRIPTION: Draws a white circle centered at (135, 86) with radius 19.
; PLAN: r0=135(x), r1=86(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 86
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
