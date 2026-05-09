; DESCRIPTION: Renders a green disk with center (431, 81) and radius 54.
; PLAN: r0=431(x), r1=81(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 81
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
