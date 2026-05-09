; DESCRIPTION: Creates a yellow circular shape at (84, 130) with radius 41.
; PLAN: r0=84(x), r1=130(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 130
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
