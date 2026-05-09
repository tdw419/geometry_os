; DESCRIPTION: Renders a yellow disk with center (86, 154) and radius 22.
; PLAN: r0=86(x), r1=154(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 154
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
