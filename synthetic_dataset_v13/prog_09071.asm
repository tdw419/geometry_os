; DESCRIPTION: Creates a green circular shape at (203, 166) with radius 37.
; PLAN: r0=203(x), r1=166(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 166
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
