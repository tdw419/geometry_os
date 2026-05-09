; DESCRIPTION: Creates a magenta circular shape at (224, 122) with radius 12.
; PLAN: r0=224(x), r1=122(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 122
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
