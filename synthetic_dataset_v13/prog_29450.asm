; DESCRIPTION: Draws a orange rectangle at (313, 122) with width 34 and height 20.
; PLAN: r0=313(x), r1=122(y), r2=34(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 122
LDI r2, 34
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
