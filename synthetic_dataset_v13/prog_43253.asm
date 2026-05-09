; DESCRIPTION: Draws a orange rectangle at (134, 154) with width 101 and height 65.
; PLAN: r0=134(x), r1=154(y), r2=101(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 154
LDI r2, 101
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
