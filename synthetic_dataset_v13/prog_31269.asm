; DESCRIPTION: Creates a green circular shape at (94, 157) with radius 10.
; PLAN: r0=94(x), r1=157(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 157
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
