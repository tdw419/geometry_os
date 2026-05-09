; DESCRIPTION: Creates a orange circular shape at (94, 130) with radius 48.
; PLAN: r0=94(x), r1=130(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 130
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
