; DESCRIPTION: Draws a orange rectangle at (65, 62) with width 34 and height 109.
; PLAN: r0=65(x), r1=62(y), r2=34(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 62
LDI r2, 34
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
