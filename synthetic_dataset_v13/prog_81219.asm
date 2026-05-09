; DESCRIPTION: Composite: Renders a magenta disk with center (288, 200) and radius 40 then Sets a single white pixel at (67, 155).
; PLAN: r0=288(x), r1=200(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=67(x), r6=155(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 288
LDI r1, 200
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 67
LDI r6, 155
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
