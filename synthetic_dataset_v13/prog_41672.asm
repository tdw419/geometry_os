; DESCRIPTION: Creates a green circular shape at (359, 192) with radius 50.
; PLAN: r0=359(x), r1=192(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 192
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
