; DESCRIPTION: Creates a yellow circular shape at (456, 34) with radius 13.
; PLAN: r0=456(x), r1=34(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 34
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
