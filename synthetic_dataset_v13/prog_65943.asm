; DESCRIPTION: Draws a orange rectangle at (96, 69) with width 63 and height 108.
; PLAN: r0=96(x), r1=69(y), r2=63(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 69
LDI r2, 63
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
