; DESCRIPTION: Renders a yellow disk with center (384, 183) and radius 55.
; PLAN: r0=384(x), r1=183(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 183
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
