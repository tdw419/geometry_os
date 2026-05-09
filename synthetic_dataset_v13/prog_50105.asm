; DESCRIPTION: Draws a blue circle centered at (343, 151) with radius 70.
; PLAN: r0=343(x), r1=151(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 151
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
