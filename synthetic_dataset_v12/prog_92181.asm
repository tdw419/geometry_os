; DESCRIPTION: Draws a blue circle centered at (72, 133) with radius 56.
; PLAN: r0=72(x), r1=133(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 133
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
