; DESCRIPTION: Creates a green circular shape at (28, 114) with radius 17.
; PLAN: r0=28(x), r1=114(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 114
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
