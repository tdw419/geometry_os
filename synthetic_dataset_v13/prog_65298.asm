; DESCRIPTION: Renders a green disk with center (175, 54) and radius 46.
; PLAN: r0=175(x), r1=54(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 54
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
