; DESCRIPTION: Renders a black disk with center (384, 165) and radius 74.
; PLAN: r0=384(x), r1=165(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 165
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
