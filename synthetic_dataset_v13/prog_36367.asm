; DESCRIPTION: Renders a blue disk with center (217, 189) and radius 25.
; PLAN: r0=217(x), r1=189(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 189
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
