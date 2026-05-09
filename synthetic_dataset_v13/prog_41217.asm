; DESCRIPTION: Draws a orange rectangle at (224, 14) with width 101 and height 16.
; PLAN: r0=224(x), r1=14(y), r2=101(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 14
LDI r2, 101
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
