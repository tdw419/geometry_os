; DESCRIPTION: Draws a orange rectangle at (84, 67) with width 38 and height 39.
; PLAN: r0=84(x), r1=67(y), r2=38(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 67
LDI r2, 38
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
