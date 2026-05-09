; DESCRIPTION: Draws a yellow rectangle at (310, 81) with width 67 and height 69.
; PLAN: r0=310(x), r1=81(y), r2=67(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 81
LDI r2, 67
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
