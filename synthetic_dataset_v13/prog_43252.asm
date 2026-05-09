; DESCRIPTION: Renders a green disk with center (240, 141) and radius 76.
; PLAN: r0=240(x), r1=141(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 141
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
