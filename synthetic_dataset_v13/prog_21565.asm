; DESCRIPTION: Creates a green circular shape at (67, 137) with radius 50.
; PLAN: r0=67(x), r1=137(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 137
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
