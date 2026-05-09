; DESCRIPTION: Renders a green disk with center (435, 121) and radius 38.
; PLAN: r0=435(x), r1=121(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 121
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
