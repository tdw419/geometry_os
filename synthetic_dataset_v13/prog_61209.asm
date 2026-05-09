; DESCRIPTION: Creates a blue circular shape at (431, 40) with radius 39.
; PLAN: r0=431(x), r1=40(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 40
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
