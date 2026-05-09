; DESCRIPTION: Draws a orange rectangle at (119, 39) with width 13 and height 88.
; PLAN: r0=119(x), r1=39(y), r2=13(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 39
LDI r2, 13
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
