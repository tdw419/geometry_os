; DESCRIPTION: Renders a red disk with center (409, 62) and radius 10.
; PLAN: r0=409(x), r1=62(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 62
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
