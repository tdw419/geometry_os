; DESCRIPTION: Draws a blue circle centered at (343, 113) with radius 78.
; PLAN: r0=343(x), r1=113(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 113
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
