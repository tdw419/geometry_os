; DESCRIPTION: Draws a green rectangle at (67, 13) with width 102 and height 117.
; PLAN: r0=67(x), r1=13(y), r2=102(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 13
LDI r2, 102
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
