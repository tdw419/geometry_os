; DESCRIPTION: Creates a orange circular shape at (140, 130) with radius 24.
; PLAN: r0=140(x), r1=130(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 130
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
