; DESCRIPTION: Draws a white circle centered at (107, 88) with radius 63.
; PLAN: r0=107(x), r1=88(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 88
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
