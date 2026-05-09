; DESCRIPTION: Creates a green circular shape at (78, 108) with radius 29.
; PLAN: r0=78(x), r1=108(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 108
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
