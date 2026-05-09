; DESCRIPTION: Creates a yellow circular shape at (372, 175) with radius 46.
; PLAN: r0=372(x), r1=175(y), r2=46(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 175
LDI r2, 46
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
