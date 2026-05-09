; DESCRIPTION: Renders a blue disk with center (431, 195) and radius 54.
; PLAN: r0=431(x), r1=195(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 195
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
