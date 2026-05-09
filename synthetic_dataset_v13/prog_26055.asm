; DESCRIPTION: Renders a magenta disk with center (105, 104) and radius 17.
; PLAN: r0=105(x), r1=104(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 104
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
