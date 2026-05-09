; DESCRIPTION: Renders a yellow disk with center (367, 175) and radius 65.
; PLAN: r0=367(x), r1=175(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 175
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
