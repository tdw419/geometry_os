; DESCRIPTION: Renders a green disk with center (347, 86) and radius 65.
; PLAN: r0=347(x), r1=86(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 86
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
