; DESCRIPTION: Renders a green disk with center (239, 54) and radius 35.
; PLAN: r0=239(x), r1=54(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 54
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
