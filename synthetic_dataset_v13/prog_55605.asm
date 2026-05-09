; DESCRIPTION: Renders a yellow disk with center (439, 159) and radius 69.
; PLAN: r0=439(x), r1=159(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 159
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
