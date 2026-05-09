; DESCRIPTION: Places a blue circle of radius 62 at center (270, 128).
; PLAN: r0=270(x), r1=128(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 128
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
