; DESCRIPTION: Draws a blue circle centered at (151, 61) with radius 35.
; PLAN: r0=151(x), r1=61(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 61
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
