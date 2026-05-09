; DESCRIPTION: Creates a yellow circular shape at (160, 174) with radius 34.
; PLAN: r0=160(x), r1=174(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 174
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
