; DESCRIPTION: Creates a cyan circular shape at (227, 75) with radius 54.
; PLAN: r0=227(x), r1=75(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 75
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
