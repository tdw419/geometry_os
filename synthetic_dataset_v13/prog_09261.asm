; DESCRIPTION: Renders a blue disk with center (306, 46) and radius 29.
; PLAN: r0=306(x), r1=46(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 46
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
