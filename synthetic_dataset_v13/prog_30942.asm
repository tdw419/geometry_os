; DESCRIPTION: Renders a yellow disk with center (353, 121) and radius 30.
; PLAN: r0=353(x), r1=121(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 121
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
