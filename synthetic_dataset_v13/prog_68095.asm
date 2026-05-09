; DESCRIPTION: Renders a black disk with center (137, 68) and radius 60.
; PLAN: r0=137(x), r1=68(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 68
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
