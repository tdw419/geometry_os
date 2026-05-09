; DESCRIPTION: Renders a magenta disk with center (416, 162) and radius 10.
; PLAN: r0=416(x), r1=162(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 162
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
