; DESCRIPTION: Draws a orange rectangle at (312, 49) with width 78 and height 40.
; PLAN: r0=312(x), r1=49(y), r2=78(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 49
LDI r2, 78
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
