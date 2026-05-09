; DESCRIPTION: Draws a orange rectangle at (18, 154) with width 25 and height 88.
; PLAN: r0=18(x), r1=154(y), r2=25(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 154
LDI r2, 25
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
