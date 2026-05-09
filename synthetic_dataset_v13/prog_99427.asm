; DESCRIPTION: Draws a blue circle centered at (346, 211) with radius 40.
; PLAN: r0=346(x), r1=211(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 211
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
