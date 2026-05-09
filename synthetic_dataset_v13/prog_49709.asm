; DESCRIPTION: Creates a green circular shape at (74, 102) with radius 13.
; PLAN: r0=74(x), r1=102(y), r2=13(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 102
LDI r2, 13
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
