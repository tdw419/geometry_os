; DESCRIPTION: Creates a blue circular shape at (252, 130) with radius 44.
; PLAN: r0=252(x), r1=130(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 130
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
