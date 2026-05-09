; DESCRIPTION: Renders a black disk with center (397, 192) and radius 50.
; PLAN: r0=397(x), r1=192(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 192
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
