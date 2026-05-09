; DESCRIPTION: Draws a orange rectangle at (416, 8) with width 50 and height 99.
; PLAN: r0=416(x), r1=8(y), r2=50(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 8
LDI r2, 50
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
