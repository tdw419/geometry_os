; DESCRIPTION: Draws a orange rectangle at (224, 21) with width 116 and height 67.
; PLAN: r0=224(x), r1=21(y), r2=116(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 21
LDI r2, 116
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
