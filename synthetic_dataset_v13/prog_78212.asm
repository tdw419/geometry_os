; DESCRIPTION: Creates a green circular shape at (290, 105) with radius 17.
; PLAN: r0=290(x), r1=105(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 105
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
