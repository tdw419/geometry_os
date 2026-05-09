; DESCRIPTION: Renders a purple disk with center (264, 165) and radius 43.
; PLAN: r0=264(x), r1=165(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 165
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
