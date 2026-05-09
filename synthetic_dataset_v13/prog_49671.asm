; DESCRIPTION: Draws a green rectangle at (430, 172) with width 67 and height 55.
; PLAN: r0=430(x), r1=172(y), r2=67(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 172
LDI r2, 67
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
