; DESCRIPTION: Draws a blue circle centered at (111, 94) with radius 53.
; PLAN: r0=111(x), r1=94(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 94
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
