; DESCRIPTION: Draws a blue circle centered at (418, 48) with radius 40.
; PLAN: r0=418(x), r1=48(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 48
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
