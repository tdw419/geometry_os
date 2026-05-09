; DESCRIPTION: Renders a yellow disk with center (87, 76) and radius 11.
; PLAN: r0=87(x), r1=76(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 76
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
