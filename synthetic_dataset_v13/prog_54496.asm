; DESCRIPTION: Creates a blue circular shape at (327, 122) with radius 37.
; PLAN: r0=327(x), r1=122(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 122
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
