; DESCRIPTION: Renders a blue disk with center (210, 55) and radius 40.
; PLAN: r0=210(x), r1=55(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 55
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
