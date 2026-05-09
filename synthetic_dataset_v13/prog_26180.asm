; DESCRIPTION: Draws a orange rectangle at (47, 88) with width 28 and height 104.
; PLAN: r0=47(x), r1=88(y), r2=28(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 88
LDI r2, 28
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
