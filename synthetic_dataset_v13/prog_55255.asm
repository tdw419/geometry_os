; DESCRIPTION: Draws a blue circle centered at (412, 129) with radius 20.
; PLAN: r0=412(x), r1=129(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 129
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
