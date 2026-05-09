; DESCRIPTION: Renders a blue disk with center (219, 65) and radius 16.
; PLAN: r0=219(x), r1=65(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 65
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
