; DESCRIPTION: Renders a black disk with center (154, 189) and radius 30.
; PLAN: r0=154(x), r1=189(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 189
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
