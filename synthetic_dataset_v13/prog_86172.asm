; DESCRIPTION: Creates a blue circular shape at (261, 101) with radius 80.
; PLAN: r0=261(x), r1=101(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 101
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
