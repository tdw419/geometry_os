; DESCRIPTION: Renders a green disk with center (205, 54) and radius 14.
; PLAN: r0=205(x), r1=54(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 54
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
