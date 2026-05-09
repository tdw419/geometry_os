; DESCRIPTION: Creates a yellow circular shape at (224, 222) with radius 12.
; PLAN: r0=224(x), r1=222(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 222
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
