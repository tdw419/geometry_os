; DESCRIPTION: Draws a green rectangle at (356, 101) with width 98 and height 67.
; PLAN: r0=356(x), r1=101(y), r2=98(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 101
LDI r2, 98
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
