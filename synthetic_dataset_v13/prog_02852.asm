; DESCRIPTION: Creates a yellow circular shape at (129, 212) with radius 38.
; PLAN: r0=129(x), r1=212(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 212
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
