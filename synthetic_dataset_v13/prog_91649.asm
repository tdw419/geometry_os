; DESCRIPTION: Creates a blue circular shape at (108, 84) with radius 31.
; PLAN: r0=108(x), r1=84(y), r2=31(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 84
LDI r2, 31
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
