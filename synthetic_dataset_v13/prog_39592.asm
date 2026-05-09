; DESCRIPTION: Creates a green circular shape at (175, 159) with radius 74.
; PLAN: r0=175(x), r1=159(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 159
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
