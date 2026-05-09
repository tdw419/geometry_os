; DESCRIPTION: Draws a blue circle centered at (418, 74) with radius 58.
; PLAN: r0=418(x), r1=74(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 74
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
