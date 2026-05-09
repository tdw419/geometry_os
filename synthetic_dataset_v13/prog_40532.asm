; DESCRIPTION: Draws a white circle centered at (424, 159) with radius 23.
; PLAN: r0=424(x), r1=159(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 159
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
