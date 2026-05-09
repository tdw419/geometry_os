; DESCRIPTION: Renders a yellow disk with center (190, 193) and radius 13.
; PLAN: r0=190(x), r1=193(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 193
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
