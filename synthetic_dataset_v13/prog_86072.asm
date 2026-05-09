; DESCRIPTION: Renders a white disk with center (152, 192) and radius 49.
; PLAN: r0=152(x), r1=192(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 192
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
