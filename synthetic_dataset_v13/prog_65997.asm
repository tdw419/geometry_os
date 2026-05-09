; DESCRIPTION: Draws a orange rectangle at (366, 32) with width 38 and height 67.
; PLAN: r0=366(x), r1=32(y), r2=38(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 32
LDI r2, 38
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
