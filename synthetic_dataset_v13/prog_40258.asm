; DESCRIPTION: Renders a yellow disk with center (76, 75) and radius 50.
; PLAN: r0=76(x), r1=75(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 75
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
