; DESCRIPTION: Renders a yellow disk with center (148, 65) and radius 46.
; PLAN: r0=148(x), r1=65(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 65
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
