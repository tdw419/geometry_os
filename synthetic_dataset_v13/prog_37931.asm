; DESCRIPTION: Draws a orange rectangle at (22, 22) with width 70 and height 28.
; PLAN: r0=22(x), r1=22(y), r2=70(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 22
LDI r2, 70
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
