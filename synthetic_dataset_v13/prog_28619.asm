; DESCRIPTION: Draws a blue circle centered at (385, 180) with radius 72.
; PLAN: r0=385(x), r1=180(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 180
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
