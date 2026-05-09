; DESCRIPTION: Draws a orange rectangle at (86, 122) with width 35 and height 94.
; PLAN: r0=86(x), r1=122(y), r2=35(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 122
LDI r2, 35
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
