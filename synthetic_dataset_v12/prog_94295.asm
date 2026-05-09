; DESCRIPTION: Draws a blue circle centered at (233, 131) with radius 28.
; PLAN: r0=233(x), r1=131(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 131
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
