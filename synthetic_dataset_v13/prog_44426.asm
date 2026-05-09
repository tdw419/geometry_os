; DESCRIPTION: Renders a yellow disk with center (446, 137) and radius 35.
; PLAN: r0=446(x), r1=137(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 137
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
