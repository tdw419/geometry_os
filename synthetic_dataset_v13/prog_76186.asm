; DESCRIPTION: Draws a blue circle centered at (72, 126) with radius 34.
; PLAN: r0=72(x), r1=126(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 126
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
