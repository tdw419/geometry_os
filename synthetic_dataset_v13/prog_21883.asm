; DESCRIPTION: Draws a orange rectangle at (62, 30) with width 101 and height 95.
; PLAN: r0=62(x), r1=30(y), r2=101(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 30
LDI r2, 101
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
