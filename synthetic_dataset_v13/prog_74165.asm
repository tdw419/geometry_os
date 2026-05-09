; DESCRIPTION: Renders a green disk with center (152, 31) and radius 17.
; PLAN: r0=152(x), r1=31(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 31
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
