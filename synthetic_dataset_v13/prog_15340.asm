; DESCRIPTION: Creates a blue circular shape at (320, 100) with radius 60.
; PLAN: r0=320(x), r1=100(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 100
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
