; DESCRIPTION: Draws a orange rectangle at (366, 50) with width 46 and height 67.
; PLAN: r0=366(x), r1=50(y), r2=46(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 50
LDI r2, 46
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
