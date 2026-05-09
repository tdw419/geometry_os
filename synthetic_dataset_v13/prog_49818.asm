; DESCRIPTION: Renders a black disk with center (103, 54) and radius 46.
; PLAN: r0=103(x), r1=54(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 54
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
