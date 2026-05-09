; DESCRIPTION: Renders a black disk with center (247, 121) and radius 20.
; PLAN: r0=247(x), r1=121(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 121
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
