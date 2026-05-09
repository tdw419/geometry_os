; DESCRIPTION: Renders a blue disk with center (312, 112) and radius 55.
; PLAN: r0=312(x), r1=112(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 112
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
