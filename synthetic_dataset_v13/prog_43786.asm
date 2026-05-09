; DESCRIPTION: Draws a white circle centered at (247, 86) with radius 17.
; PLAN: r0=247(x), r1=86(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 86
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
