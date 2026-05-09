; DESCRIPTION: Renders a blue disk with center (38, 114) and radius 29.
; PLAN: r0=38(x), r1=114(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 38
LDI r1, 114
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
