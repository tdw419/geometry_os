; DESCRIPTION: Renders a green disk with center (129, 138) and radius 61.
; PLAN: r0=129(x), r1=138(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 138
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
