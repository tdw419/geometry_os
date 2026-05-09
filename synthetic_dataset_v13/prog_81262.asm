; DESCRIPTION: Draws a blue circle centered at (223, 171) with radius 67.
; PLAN: r0=223(x), r1=171(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 171
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
