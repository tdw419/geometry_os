; DESCRIPTION: Draws a orange rectangle at (176, 67) with width 67 and height 99.
; PLAN: r0=176(x), r1=67(y), r2=67(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 67
LDI r2, 67
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
