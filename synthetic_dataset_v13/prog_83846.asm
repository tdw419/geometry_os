; DESCRIPTION: Renders a yellow disk with center (166, 199) and radius 29.
; PLAN: r0=166(x), r1=199(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 199
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
