; DESCRIPTION: Draws a red rectangle at (67, 70) with width 39 and height 114.
; PLAN: r0=67(x), r1=70(y), r2=39(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 70
LDI r2, 39
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
