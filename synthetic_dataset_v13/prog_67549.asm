; DESCRIPTION: Creates a purple circular shape at (224, 76) with radius 39.
; PLAN: r0=224(x), r1=76(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 76
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
