; DESCRIPTION: Draws a blue circle centered at (285, 74) with radius 53.
; PLAN: r0=285(x), r1=74(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 74
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
