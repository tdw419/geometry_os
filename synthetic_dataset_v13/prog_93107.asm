; DESCRIPTION: Creates a blue circular shape at (97, 84) with radius 72.
; PLAN: r0=97(x), r1=84(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 84
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
