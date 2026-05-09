; DESCRIPTION: Creates a blue circular shape at (320, 114) with radius 18.
; PLAN: r0=320(x), r1=114(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 114
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
