; DESCRIPTION: Renders a yellow disk with center (430, 87) and radius 55.
; PLAN: r0=430(x), r1=87(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 87
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
