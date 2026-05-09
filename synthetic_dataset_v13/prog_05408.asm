; DESCRIPTION: Creates a purple circular shape at (17, 130) with radius 12.
; PLAN: r0=17(x), r1=130(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 17
LDI r1, 130
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
