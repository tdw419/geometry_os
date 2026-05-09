; DESCRIPTION: Draws a white rectangle at (67, 67) with width 108 and height 102.
; PLAN: r0=67(x), r1=67(y), r2=108(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 67
LDI r2, 108
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
