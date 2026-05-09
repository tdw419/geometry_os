; DESCRIPTION: Renders a green disk with center (65, 58) and radius 14.
; PLAN: r0=65(x), r1=58(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 58
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
