; DESCRIPTION: Draws a orange rectangle at (224, 96) with width 38 and height 11.
; PLAN: r0=224(x), r1=96(y), r2=38(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 96
LDI r2, 38
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
