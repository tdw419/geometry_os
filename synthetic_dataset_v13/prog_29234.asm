; DESCRIPTION: Draws a purple rectangle at (316, 224) with width 87 and height 24.
; PLAN: r0=316(x), r1=224(y), r2=87(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 224
LDI r2, 87
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
