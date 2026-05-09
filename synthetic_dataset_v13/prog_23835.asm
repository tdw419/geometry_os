; DESCRIPTION: Draws a blue circle centered at (269, 53) with radius 24.
; PLAN: r0=269(x), r1=53(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 53
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
