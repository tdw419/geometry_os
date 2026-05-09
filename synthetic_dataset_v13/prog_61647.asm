; DESCRIPTION: Draws a magenta circle centered at (224, 141) with radius 14.
; PLAN: r0=224(x), r1=141(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 141
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
