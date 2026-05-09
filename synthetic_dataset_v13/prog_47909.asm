; DESCRIPTION: Draws a white rectangle at (472, 67) with width 28 and height 88.
; PLAN: r0=472(x), r1=67(y), r2=28(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 67
LDI r2, 28
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
