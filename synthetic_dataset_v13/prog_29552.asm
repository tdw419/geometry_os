; DESCRIPTION: Draws a blue circle centered at (74, 203) with radius 48.
; PLAN: r0=74(x), r1=203(y), r2=48(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 203
LDI r2, 48
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
