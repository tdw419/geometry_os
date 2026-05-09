; DESCRIPTION: Draws a blue circle centered at (372, 165) with radius 46.
; PLAN: r0=372(x), r1=165(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 165
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
