; DESCRIPTION: Draws a purple rectangle at (224, 31) with width 10 and height 62.
; PLAN: r0=224(x), r1=31(y), r2=10(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 31
LDI r2, 10
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
