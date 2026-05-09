; DESCRIPTION: Draws a blue circle centered at (277, 163) with radius 74.
; PLAN: r0=277(x), r1=163(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 163
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
