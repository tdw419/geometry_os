; DESCRIPTION: Draws a yellow circle centered at (373, 224) with radius 32.
; PLAN: r0=373(x), r1=224(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 224
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
