; DESCRIPTION: Renders a black disk with center (294, 43) and radius 14.
; PLAN: r0=294(x), r1=43(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 43
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
