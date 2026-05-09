; DESCRIPTION: Creates a yellow circular shape at (281, 54) with radius 18.
; PLAN: r0=281(x), r1=54(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 54
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
