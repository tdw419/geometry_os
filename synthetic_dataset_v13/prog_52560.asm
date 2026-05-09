; DESCRIPTION: Draws a green rectangle at (265, 67) with width 113 and height 12.
; PLAN: r0=265(x), r1=67(y), r2=113(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 67
LDI r2, 113
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
