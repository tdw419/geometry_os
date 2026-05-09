; DESCRIPTION: Creates a green circular shape at (119, 108) with radius 68.
; PLAN: r0=119(x), r1=108(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 108
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
