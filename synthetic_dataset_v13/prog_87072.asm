; DESCRIPTION: Creates a purple circular shape at (143, 130) with radius 56.
; PLAN: r0=143(x), r1=130(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 130
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
