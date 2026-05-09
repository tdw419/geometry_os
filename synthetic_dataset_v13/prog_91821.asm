; DESCRIPTION: Draws a orange rectangle at (68, 96) with width 47 and height 29.
; PLAN: r0=68(x), r1=96(y), r2=47(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 96
LDI r2, 47
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
