; DESCRIPTION: Renders a blue disk with center (226, 189) and radius 65.
; PLAN: r0=226(x), r1=189(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 189
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
