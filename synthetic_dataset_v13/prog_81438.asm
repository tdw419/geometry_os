; DESCRIPTION: Renders a yellow disk with center (175, 95) and radius 58.
; PLAN: r0=175(x), r1=95(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 95
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
