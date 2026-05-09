; DESCRIPTION: Draws a blue circle centered at (171, 113) with radius 65.
; PLAN: r0=171(x), r1=113(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 113
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
