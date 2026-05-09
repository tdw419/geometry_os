; DESCRIPTION: Renders a blue disk with center (333, 81) and radius 54.
; PLAN: r0=333(x), r1=81(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 81
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
