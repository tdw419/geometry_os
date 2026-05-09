; DESCRIPTION: Renders a black disk with center (424, 188) and radius 48.
; PLAN: r0=424(x), r1=188(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 188
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
