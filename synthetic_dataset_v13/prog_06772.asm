; DESCRIPTION: Creates a magenta circular shape at (412, 224) with radius 17.
; PLAN: r0=412(x), r1=224(y), r2=17(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 224
LDI r2, 17
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
