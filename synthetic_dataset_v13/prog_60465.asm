; DESCRIPTION: Renders a yellow disk with center (134, 56) and radius 50.
; PLAN: r0=134(x), r1=56(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 56
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
