; DESCRIPTION: Draws a blue circle centered at (116, 113) with radius 70.
; PLAN: r0=116(x), r1=113(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 113
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
