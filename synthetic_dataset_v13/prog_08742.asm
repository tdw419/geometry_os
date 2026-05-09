; DESCRIPTION: Renders a yellow disk with center (166, 167) and radius 35.
; PLAN: r0=166(x), r1=167(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 167
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
