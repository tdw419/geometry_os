; DESCRIPTION: Renders a yellow disk with center (457, 197) and radius 29.
; PLAN: r0=457(x), r1=197(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 457
LDI r1, 197
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
