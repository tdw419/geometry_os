; DESCRIPTION: Draws a purple rectangle at (69, 224) with width 26 and height 23.
; PLAN: r0=69(x), r1=224(y), r2=26(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 224
LDI r2, 26
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
