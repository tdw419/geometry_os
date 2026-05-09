; DESCRIPTION: Renders a magenta disk with center (288, 185) and radius 52.
; PLAN: r0=288(x), r1=185(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 185
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
