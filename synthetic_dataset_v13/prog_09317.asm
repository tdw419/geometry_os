; DESCRIPTION: Draws a orange rectangle at (60, 39) with width 34 and height 99.
; PLAN: r0=60(x), r1=39(y), r2=34(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 39
LDI r2, 34
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
