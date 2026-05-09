; DESCRIPTION: Creates a green circular shape at (68, 139) with radius 60.
; PLAN: r0=68(x), r1=139(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 139
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
