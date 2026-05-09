; DESCRIPTION: Creates a green circular shape at (66, 24) with radius 16.
; PLAN: r0=66(x), r1=24(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 24
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
