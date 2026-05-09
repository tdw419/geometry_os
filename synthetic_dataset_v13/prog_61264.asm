; DESCRIPTION: Draws a orange rectangle at (74, 83) with width 25 and height 26.
; PLAN: r0=74(x), r1=83(y), r2=25(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 83
LDI r2, 25
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
