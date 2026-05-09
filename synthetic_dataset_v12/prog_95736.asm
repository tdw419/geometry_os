; DESCRIPTION: Creates a green circular shape at (400, 88) with radius 42.
; PLAN: r0=400(x), r1=88(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 88
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
