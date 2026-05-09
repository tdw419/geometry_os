; DESCRIPTION: Draws a yellow circle centered at (274, 165) with radius 80.
; PLAN: r0=274(x), r1=165(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 165
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
