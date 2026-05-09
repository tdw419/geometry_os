; DESCRIPTION: Draws a white rectangle at (33, 178) with width 88 and height 67.
; PLAN: r0=33(x), r1=178(y), r2=88(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 178
LDI r2, 88
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
