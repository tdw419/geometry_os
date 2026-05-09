; DESCRIPTION: Renders a green disk with center (148, 122) and radius 52.
; PLAN: r0=148(x), r1=122(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 122
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
