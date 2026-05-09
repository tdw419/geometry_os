; DESCRIPTION: Renders a green disk with center (320, 175) and radius 66.
; PLAN: r0=320(x), r1=175(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 175
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
