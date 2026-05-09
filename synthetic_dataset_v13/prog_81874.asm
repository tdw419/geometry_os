; DESCRIPTION: Renders a black disk with center (100, 68) and radius 13.
; PLAN: r0=100(x), r1=68(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 68
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
