; DESCRIPTION: Renders a green disk with center (270, 161) and radius 43.
; PLAN: r0=270(x), r1=161(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 161
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
