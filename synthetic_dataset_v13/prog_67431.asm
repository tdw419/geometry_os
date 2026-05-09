; DESCRIPTION: Draws a orange rectangle at (395, 101) with width 117 and height 14.
; PLAN: r0=395(x), r1=101(y), r2=117(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 101
LDI r2, 117
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
