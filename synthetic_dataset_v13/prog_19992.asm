; DESCRIPTION: Creates a blue circular shape at (97, 174) with radius 32.
; PLAN: r0=97(x), r1=174(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 174
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
