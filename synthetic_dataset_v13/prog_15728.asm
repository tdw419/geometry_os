; DESCRIPTION: Creates a yellow circular shape at (376, 130) with radius 56.
; PLAN: r0=376(x), r1=130(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 130
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
