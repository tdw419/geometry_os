; DESCRIPTION: Draws a purple circle centered at (224, 168) with radius 74.
; PLAN: r0=224(x), r1=168(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 168
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
