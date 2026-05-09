; DESCRIPTION: Renders a black disk with center (375, 68) and radius 12.
; PLAN: r0=375(x), r1=68(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 68
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
