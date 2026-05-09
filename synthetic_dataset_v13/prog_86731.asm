; DESCRIPTION: Draws a blue circle centered at (387, 185) with radius 34.
; PLAN: r0=387(x), r1=185(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 185
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
