; DESCRIPTION: Creates a yellow circular shape at (224, 78) with radius 73.
; PLAN: r0=224(x), r1=78(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 78
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
