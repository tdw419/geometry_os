; DESCRIPTION: Draws a green circle centered at (74, 113) with radius 13.
; PLAN: r0=74(x), r1=113(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 113
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
