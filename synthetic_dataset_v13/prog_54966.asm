; DESCRIPTION: Renders a green disk with center (416, 195) and radius 17.
; PLAN: r0=416(x), r1=195(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 195
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
