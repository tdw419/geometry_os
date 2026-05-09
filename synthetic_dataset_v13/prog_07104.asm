; DESCRIPTION: Renders a purple disk with center (261, 165) and radius 25.
; PLAN: r0=261(x), r1=165(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 165
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
