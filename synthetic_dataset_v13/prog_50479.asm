; DESCRIPTION: Creates a green circular shape at (153, 66) with radius 56.
; PLAN: r0=153(x), r1=66(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 66
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
