; DESCRIPTION: Renders a magenta disk with center (316, 188) and radius 20.
; PLAN: r0=316(x), r1=188(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 316
LDI r1, 188
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
