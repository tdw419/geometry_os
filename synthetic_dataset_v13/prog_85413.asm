; DESCRIPTION: Draws a blue circle centered at (353, 111) with radius 53.
; PLAN: r0=353(x), r1=111(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 111
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
