; DESCRIPTION: Renders a blue disk with center (243, 181) and radius 20.
; PLAN: r0=243(x), r1=181(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 181
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
