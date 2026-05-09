; DESCRIPTION: Draws a red rectangle at (134, 84) with width 67 and height 38.
; PLAN: r0=134(x), r1=84(y), r2=67(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 84
LDI r2, 67
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
