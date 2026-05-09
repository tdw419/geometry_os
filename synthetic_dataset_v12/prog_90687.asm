; DESCRIPTION: Renders a black disk with center (320, 98) and radius 33.
; PLAN: r0=320(x), r1=98(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 98
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
