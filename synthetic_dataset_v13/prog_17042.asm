; DESCRIPTION: Creates a green circular shape at (42, 203) with radius 15.
; PLAN: r0=42(x), r1=203(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 203
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
