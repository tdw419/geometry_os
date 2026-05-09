; DESCRIPTION: Creates a yellow circular shape at (253, 50) with radius 34.
; PLAN: r0=253(x), r1=50(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 50
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
