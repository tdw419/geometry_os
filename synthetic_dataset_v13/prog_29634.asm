; DESCRIPTION: Creates a cyan circular shape at (204, 100) with radius 54.
; PLAN: r0=204(x), r1=100(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 100
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
