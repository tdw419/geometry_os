; DESCRIPTION: Creates a yellow circular shape at (418, 130) with radius 74.
; PLAN: r0=418(x), r1=130(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 130
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
