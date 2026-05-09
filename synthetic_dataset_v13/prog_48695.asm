; DESCRIPTION: Draws a white circle centered at (136, 151) with radius 24.
; PLAN: r0=136(x), r1=151(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 151
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
