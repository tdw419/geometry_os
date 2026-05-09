; DESCRIPTION: Renders a green disk with center (397, 103) and radius 80.
; PLAN: r0=397(x), r1=103(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 103
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
