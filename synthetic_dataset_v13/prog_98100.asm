; DESCRIPTION: Renders a green disk with center (397, 219) and radius 12.
; PLAN: r0=397(x), r1=219(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 219
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
