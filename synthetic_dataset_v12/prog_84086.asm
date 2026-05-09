; DESCRIPTION: Renders a yellow disk with center (442, 75) and radius 55.
; PLAN: r0=442(x), r1=75(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 75
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
