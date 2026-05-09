; DESCRIPTION: Draws a white circle centered at (424, 183) with radius 21.
; PLAN: r0=424(x), r1=183(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 183
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
