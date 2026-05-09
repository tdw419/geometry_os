; DESCRIPTION: Draws a blue circle centered at (333, 116) with radius 13.
; PLAN: r0=333(x), r1=116(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 116
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
