; DESCRIPTION: Draws a white rectangle at (315, 122) with width 78 and height 113.
; PLAN: r0=315(x), r1=122(y), r2=78(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 122
LDI r2, 78
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
