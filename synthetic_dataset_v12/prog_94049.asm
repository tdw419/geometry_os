; DESCRIPTION: Creates a orange circular shape at (103, 130) with radius 70.
; PLAN: r0=103(x), r1=130(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 130
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
