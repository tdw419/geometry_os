; DESCRIPTION: Draws a white circle centered at (74, 53) with radius 17.
; PLAN: r0=74(x), r1=53(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 53
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
