; DESCRIPTION: Renders a magenta disk with center (390, 152) and radius 29.
; PLAN: r0=390(x), r1=152(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 152
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
