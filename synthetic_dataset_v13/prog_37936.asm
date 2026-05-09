; DESCRIPTION: Renders a magenta disk with center (277, 110) and radius 34.
; PLAN: r0=277(x), r1=110(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 110
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
