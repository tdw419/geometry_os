; DESCRIPTION: Renders a black disk with center (490, 54) and radius 11.
; PLAN: r0=490(x), r1=54(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 490
LDI r1, 54
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
