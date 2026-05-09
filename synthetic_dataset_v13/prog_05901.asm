; DESCRIPTION: Creates a yellow circular shape at (459, 175) with radius 19.
; PLAN: r0=459(x), r1=175(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 175
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
