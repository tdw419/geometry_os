; DESCRIPTION: Renders a yellow disk with center (166, 162) and radius 60.
; PLAN: r0=166(x), r1=162(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 162
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
