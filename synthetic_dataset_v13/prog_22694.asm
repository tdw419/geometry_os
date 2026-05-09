; DESCRIPTION: Renders a white disk with center (144, 99) and radius 69.
; PLAN: r0=144(x), r1=99(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 99
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
