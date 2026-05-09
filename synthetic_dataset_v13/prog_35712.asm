; DESCRIPTION: Renders a blue disk with center (306, 95) and radius 12.
; PLAN: r0=306(x), r1=95(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 95
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
