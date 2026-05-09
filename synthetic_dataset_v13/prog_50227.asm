; DESCRIPTION: Creates a blue circular shape at (296, 128) with radius 75.
; PLAN: r0=296(x), r1=128(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 128
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
