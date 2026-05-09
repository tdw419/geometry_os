; DESCRIPTION: Renders a blue disk with center (243, 65) and radius 30.
; PLAN: r0=243(x), r1=65(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 65
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
