; DESCRIPTION: Draws a green rectangle at (3, 17) with width 67 and height 113.
; PLAN: r0=3(x), r1=17(y), r2=67(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 17
LDI r2, 67
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
