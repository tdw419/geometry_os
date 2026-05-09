; DESCRIPTION: Renders a magenta disk with center (188, 104) and radius 80.
; PLAN: r0=188(x), r1=104(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 104
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
