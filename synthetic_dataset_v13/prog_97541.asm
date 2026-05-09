; DESCRIPTION: Renders a yellow disk with center (175, 165) and radius 50.
; PLAN: r0=175(x), r1=165(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 165
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
